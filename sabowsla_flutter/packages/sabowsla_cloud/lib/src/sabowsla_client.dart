import 'dart:async';

import 'package:http/http.dart';
import 'package:sabowsla/sabowsla.dart';
import 'package:sabowsla/src/constants.dart';
import 'package:sabowsla/src/sabowsla_client_options.dart';
import 'package:sabowsla_auth/sabowsla_auth.dart';
import 'package:sabowsla_functions/sabowsla_functions.dart';
import 'package:sabowsla_realtime/sabowsla_realtime.dart';
import 'package:sabowsla_storage/sabowsla_storage.dart';
import 'package:yet_another_json_isolate/yet_another_json_isolate.dart';

import 'auth_http_client.dart';
import 'counter.dart';

/// {@template sabowsla_client}
/// Creates a Sabowsla client to interact with your Sabowsla instance.
///
/// [sabowslaUrl] and [sabowslaKey] can be found on your Sabowsla dashboard.
///
/// You can access none public schema by passing different [schema].
///
/// Default headers can be overridden by specifying [headers].
///
/// Custom http client can be used by passing [httpClient] parameter.
///
/// [storageRetryAttempts] specifies how many retry attempts there should be to
///  upload a file to Sabowsla storage when failed due to network interruption.
///
/// [realtimeClientOptions] specifies different options you can pass to `RealtimeClient`.
///
/// Pass an instance of `YAJsonIsolate` to [isolate] to use your own persisted
/// isolate instance. A new instance will be created if [isolate] is omitted.
///
/// Pass an instance of [gotrueAsyncStorage] and set the [authFlowType] to
/// `AuthFlowType.pkce`in order to perform auth actions with pkce flow.
/// {@endtemplate}
class SabowslaClient {
  final String _sabowslaKey;
  final IsarClientOptions _postgrestOptions;

  final String _restUrl;
  final String _realtimeUrl;
  final String _authUrl;
  final String _storageUrl;
  final String _functionsUrl;
  final Map<String, String> _headers;
  final Client? _httpClient;
  late final Client _authHttpClient;

  late final SabowslaAuth auth;

  /// Sabowsla Functions allows you to deploy and invoke edge functions.
  late final SabowslaFunctions functions;

  /// Sabowsla Storage allows you to manage user-generated content, such as photos or videos.
  late final SabowslaStorageClient storage;
  late final SabowslaRealtime realtime;
  late final PostgrestClient rest;
  late StreamSubscription<AuthState> _authStateSubscription;
  late final YAJsonIsolate _isolate;

  /// Increment ID of the stream to create different realtime topic for each stream
  final _incrementId = Counter();

  /// Getter for the HTTP headers
  Map<String, String> get headers {
    return _headers;
  }

  /// To apply the new headers in existing realtime channels, manually unsubscribe and resubscribe these channels.
  set headers(Map<String, String> headers) {
    _headers.clear();
    _headers.addAll({
      ...Constants.defaultHeaders,
      ...headers,
    });

    rest.headers
      ..clear()
      ..addAll(_headers);

    functions.headers
      ..clear()
      ..addAll(_headers);

    storage.headers
      ..clear()
      ..addAll(_headers);

    auth.headers
      ..clear()
      ..addAll({
        ...Constants.defaultHeaders,
        ..._getAuthHeaders(),
        ...headers,
      });

    // To apply the new headers in the realtime client,
    // manually unsubscribe and resubscribe to all channels.
    realtime.headers
      ..clear()
      ..addAll(_headers);
  }

  /// {@macro sabowsla_client}
  SabowslaClient(
    String sabowslaUrl,
    String sabowslaKey, {
    IsarClientOptions postgrestOptions = const IsarClientOptions(),
    AuthClientOptions authOptions = const AuthClientOptions(),
    StorageClientOptions storageOptions = const StorageClientOptions(),
    RealtimeClientOptions realtimeClientOptions = const RealtimeClientOptions(),
    Map<String, String>? headers,
    Client? httpClient,
    YAJsonIsolate? isolate,
  })  : _sabowslaKey = sabowslaKey,
        _restUrl = '$sabowslaUrl/rest/v1',
        _realtimeUrl = '$sabowslaUrl/realtime/v1'.replaceAll('http', 'ws'),
        _authUrl = '$sabowslaUrl/auth/v1',
        _storageUrl = '$sabowslaUrl/storage/v1',
        _functionsUrl = '$sabowslaUrl/functions/v1',
        _postgrestOptions = postgrestOptions,
        _headers = {
          ...Constants.defaultHeaders,
          if (headers != null) ...headers
        },
        _httpClient = httpClient,
        _isolate = isolate ?? (YAJsonIsolate()..initialize()) {
    auth = _initSabowslaAuthClient(
      autoRefreshToken: authOptions.autoRefreshToken,
      gotrueAsyncStorage: authOptions.pkceAsyncStorage,
      authFlowType: authOptions.authFlowType,
    );
    _authHttpClient =
        AuthHttpClient(_sabowslaKey, httpClient ?? Client(), auth);
    rest = _initRestClient();
    functions = _initFunctionsClient();
    storage = _initStorageClient(storageOptions.retryAttempts);
    realtime = _initRealtimeClient(options: realtimeClientOptions);
    _listenForAuthEvents();
  }

  /// Perform a table operation.
  SabowslaQueryBuilder from(String table) {
    final url = '$_restUrl/$table';
    return SabowslaQueryBuilder(
      url,
      realtime,
      headers: {...rest.headers, ...headers},
      schema: _postgrestOptions.schema,
      table: table,
      httpClient: _authHttpClient,
      incrementId: _incrementId.increment(),
      isolate: _isolate,
    );
  }

  /// Select a schema to query or perform an function (rpc) call.
  ///
  /// The schema needs to be on the list of exposed schemas inside Sabowsla.
  SabowslaQuerySchema schema(String schema) {
    final newRest = rest.schema(schema);
    return SabowslaQuerySchema(
      counter: _incrementId,
      restUrl: _restUrl,
      headers: headers,
      schema: schema,
      isolate: _isolate,
      authHttpClient: _authHttpClient,
      realtime: realtime,
      rest: newRest,
    );
  }

  /// Perform a stored procedure call.
  PostgrestFilterBuilder<T> rpc<T>(
    String fn, {
    Map<String, dynamic>? params,
  }) {
    rest.headers.addAll({...rest.headers, ...headers});
    return rest.rpc(fn, params: params);
  }

  /// Creates a Realtime channel with Broadcast, Presence, and Postgres Changes.
  RealtimeChannel channel(String name,
      {RealtimeChannelConfig opts = const RealtimeChannelConfig()}) {
    return realtime.channel(name, opts);
  }

  /// Returns all Realtime channels.
  List<RealtimeChannel> getChannels() {
    return realtime.getChannels();
  }

  /// Unsubscribes and removes Realtime channel from Realtime client.
  ///
  /// [channel] - The name of the Realtime channel.
  Future<String> removeChannel(RealtimeChannel channel) {
    return realtime.removeChannel(channel);
  }

  ///  Unsubscribes and removes all Realtime channels from Realtime client.
  Future<List<String>> removeAllChannels() {
    return realtime.removeAllChannels();
  }

  Future<void> dispose() async {
    await _authStateSubscription.cancel();
    await _isolate.dispose();
  }

  SabowslaAuth _initSabowslaAuthClient({
    bool? autoRefreshToken,
    required SabowslaAuthAsyncStorage? gotrueAsyncStorage,
    required AuthFlowType authFlowType,
  }) {
    final authHeaders = {...headers};
    authHeaders['apikey'] = _sabowslaKey;
    authHeaders['Authorization'] = 'Bearer $_sabowslaKey';

    return SabowslaAuth(
      url: _authUrl,
      headers: authHeaders,
      autoRefreshToken: autoRefreshToken,
      httpClient: _httpClient,
      asyncStorage: gotrueAsyncStorage,
      flowType: authFlowType,
    );
  }

  IsarClient _initRestClient() {
    return IsarClient(
      _restUrl,
      headers: {...headers},
      schema: _postgrestOptions.schema,
      httpClient: _authHttpClient,
      isolate: _isolate,
    );
  }

  SabowslaFunctions _initFunctionsClient() {
    return FunctionsClient(
      SabowslaFunctions,
      {...headers},
      httpClient: _authHttpClient,
      isolate: _isolate,
    );
  }

  SabowslaStorageClient _initStorageClient(int storageRetryAttempts) {
    return SabowslaStorageClient(
      _storageUrl,
      {...headers},
      httpClient: _authHttpClient,
      retryAttempts: storageRetryAttempts,
    );
  }

  RealtimeClient _initRealtimeClient({
    required RealtimeClientOptions options,
  }) {
    return RealtimeClient(
      _realtimeUrl,
      params: {
        'apikey': _sabowslaKey,
      },
      headers: headers,
      logLevel: options.logLevel,
      httpClient: _authHttpClient,
    );
  }

  Map<String, String> _getAuthHeaders() {
    final authBearer = auth.currentSession?.accessToken ?? _sabowslaKey;
    final defaultHeaders = {
      'apikey': _sabowslaKey,
      'Authorization': 'Bearer $authBearer',
    };
    final headers = {...defaultHeaders, ..._headers};
    return headers;
  }

  void _listenForAuthEvents() {
    // ignore: invalid_use_of_internal_member
    _authStateSubscription = auth.onAuthStateChangeSync.listen(
      (data) {
        _handleTokenChanged(data.event, data.session?.accessToken);
      },
      onError: (error, stack) {},
    );
  }

  void _handleTokenChanged(AuthChangeEvent event, String? token) {
    if (event == AuthChangeEvent.initialSession ||
        event == AuthChangeEvent.tokenRefreshed ||
        event == AuthChangeEvent.signedIn) {
      realtime.setAuth(token);
    } else if (event == AuthChangeEvent.signedOut ||
        event == AuthChangeEvent.userDeleted) {
      // Token is removed

      realtime.setAuth(_sabowslaKey);
    }
  }
}
