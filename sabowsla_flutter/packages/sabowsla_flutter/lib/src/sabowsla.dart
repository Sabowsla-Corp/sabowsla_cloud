import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:sabowsla/sabowsla.dart';
import 'package:sabowsla_flutter/src/constants.dart';
import 'package:sabowsla_flutter/src/flutter_go_true_client_options.dart';
import 'package:sabowsla_flutter/src/local_storage.dart';
import 'package:sabowsla_flutter/src/sabowsla_auth.dart';

/// Sabowsla instance.
///
/// It must be initialized before used, otherwise an error is thrown.
///
/// ```dart
/// await Sabowsla.initialize(...)
/// ```
///
/// Use it:
///
/// ```dart
/// final instance = Sabowsla.instance;
/// ```
///
/// See also:
///
///   * [SabowslaAuth]
class Sabowsla {
  /// Gets the current sabowsla instance.
  ///
  /// An [AssertionError] is thrown if sabowsla isn't initialized yet.
  /// Call [Sabowsla.initialize] to initialize it.
  static Sabowsla get instance {
    assert(
      _instance._initialized,
      'You must initialize the sabowsla instance before calling Sabowsla.instance',
    );
    return _instance;
  }

  /// Initialize the current sabowsla instance
  ///
  /// This must be called only once. If called more than once, an
  /// [AssertionError] is thrown
  ///
  /// [url] and [anonKey] can be found on your Sabowsla dashboard.
  ///
  /// You can access none public schema by passing different [schema].
  ///
  /// Default headers can be overridden by specifying [headers].
  ///
  /// Pass [localStorage] to override the default local storage option used to
  /// persist auth.
  ///
  /// Custom http client can be used by passing [httpClient] parameter.
  ///
  /// [storageRetryAttempts] specifies how many retry attempts there should be
  /// to upload a file to Sabowsla storage when failed due to network
  /// interruption.
  ///
  /// Set [authFlowType] to [AuthFlowType.implicit] to use the old implicit flow for authentication
  /// involving deep links.
  ///
  /// PKCE flow uses shared preferences for storing the code verifier by default.
  /// Pass a custom storage to [pkceAsyncStorage] to override the behavior.
  ///
  /// If [debug] is set to `true`, debug logs will be printed in debug console.
  static Future<Sabowsla> initialize({
    required String url,
    required String anonKey,
    Map<String, String>? headers,
    Client? httpClient,
    RealtimeClientOptions realtimeClientOptions = const RealtimeClientOptions(),
    PostgrestClientOptions postgrestOptions = const PostgrestClientOptions(),
    StorageClientOptions storageOptions = const StorageClientOptions(),
    FlutterAuthClientOptions authOptions = const FlutterAuthClientOptions(),
    bool? debug,
  }) async {
    assert(
      !_instance._initialized,
      'This instance is already initialized',
    );
    if (authOptions.pkceAsyncStorage == null) {
      authOptions = authOptions.copyWith(
        pkceAsyncStorage: SharedPreferencesGotrueAsyncStorage(),
      );
    }
    if (authOptions.localStorage == null) {
      authOptions = authOptions.copyWith(
        localStorage: SharedPreferencesLocalStorage(
          persistSessionKey:
              "sb-${Uri.parse(url).host.split(".").first}-auth-token",
        ),
      );
    }
    _instance._init(
      url,
      anonKey,
      httpClient: httpClient,
      customHeaders: headers,
      realtimeClientOptions: realtimeClientOptions,
      authOptions: authOptions,
      postgrestOptions: postgrestOptions,
      storageOptions: storageOptions,
    );
    _instance._debugEnable = debug ?? kDebugMode;
    _instance.log('***** Sabowsla init completed $_instance');

    _instance._sabowslaAuth = SabowslaAuth();
    await _instance._sabowslaAuth.initialize(options: authOptions);

    // Wrap `recoverSession()` in a `CancelableOperation` so that it can be canceled in dispose
    // if still in progress
    _instance._restoreSessionCancellableOperation =
        CancelableOperation.fromFuture(
      _instance._sabowslaAuth.recoverSession(),
    );

    return _instance;
  }

  Sabowsla._();
  static final Sabowsla _instance = Sabowsla._();

  bool _initialized = false;

  /// The sabowsla client for this instance
  ///
  /// Throws an error if [Sabowsla.initialize] was not called.
  late SabowslaClient client;

  late SabowslaAuth _sabowslaAuth;

  bool _debugEnable = false;

  /// Wraps the `recoverSession()` call so that it can be terminated when `dispose()` is called
  late CancelableOperation _restoreSessionCancellableOperation;

  /// Dispose the instance to free up resources.
  Future<void> dispose() async {
    await _restoreSessionCancellableOperation.cancel();
    client.dispose();
    _instance._sabowslaAuth.dispose();
    _initialized = false;
  }

  void _init(
    String sabowslaUrl,
    String sabowslaAnonKey, {
    Client? httpClient,
    Map<String, String>? customHeaders,
    required RealtimeClientOptions realtimeClientOptions,
    required PostgrestClientOptions postgrestOptions,
    required StorageClientOptions storageOptions,
    required AuthClientOptions authOptions,
  }) {
    final headers = {
      ...Constants.defaultHeaders,
      if (customHeaders != null) ...customHeaders
    };
    client = SabowslaClient(
      sabowslaUrl,
      sabowslaAnonKey,
      httpClient: httpClient,
      headers: headers,
      realtimeClientOptions: realtimeClientOptions,
      postgrestOptions: postgrestOptions,
      storageOptions: storageOptions,
      authOptions: authOptions,
    );
    _initialized = true;
  }

  void log(String msg, [StackTrace? stackTrace]) {
    if (_debugEnable) {
      debugPrint(msg);
      if (stackTrace != null) {
        debugPrintStack(stackTrace: stackTrace);
      }
    }
  }
}
