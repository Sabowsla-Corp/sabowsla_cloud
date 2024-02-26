import 'package:flutter_test/flutter_test.dart';
import 'package:sabowsla_flutter/sabowsla_flutter.dart';

import 'widget_test_stubs.dart';

void main() {
  const sabowslaUrl = '';
  const sabowslaKey = '';
  tearDown(() async => await Sabowsla.instance.dispose());

  group("Valid session", () {
    setUp(() async {
      mockAppLink();
      // Initialize the Sabowsla singleton
      await Sabowsla.initialize(
        url: sabowslaUrl,
        anonKey: sabowslaKey,
        debug: false,
        authOptions: FlutterAuthClientOptions(
          localStorage: MockLocalStorage(),
          pkceAsyncStorage: MockAsyncStorage(),
        ),
      );
    });

    test('can access Sabowsla singleton', () async {
      final sabowsla = Sabowsla.instance.client;

      expect(sabowsla, isNotNull);
    });

    test('can re-initialize client', () async {
      final sabowsla = Sabowsla.instance.client;
      await Sabowsla.instance.dispose();
      await Sabowsla.initialize(
        url: sabowslaUrl,
        anonKey: sabowslaKey,
        debug: false,
        authOptions: FlutterAuthClientOptions(
          localStorage: MockLocalStorage(),
          pkceAsyncStorage: MockAsyncStorage(),
        ),
      );

      final newClient = Sabowsla.instance.client;
      expect(sabowsla, isNot(newClient));
    });
  });

  group("Expired session", () {
    setUp(() async {
      mockAppLink();
      await Sabowsla.initialize(
        url: sabowslaUrl,
        anonKey: sabowslaKey,
        debug: false,
        authOptions: FlutterAuthClientOptions(
          localStorage: MockExpiredStorage(),
          pkceAsyncStorage: MockAsyncStorage(),
        ),
      );
    });

    test('initial session contains the error', () async {
      // Give it a delay to wait for recoverSession to throw
      await Future.delayed(const Duration(milliseconds: 10));

      await expectLater(Sabowsla.instance.client.auth.onAuthStateChange,
          emitsError(isA<AuthException>()));
    });
  });

  group("No session", () {
    setUp(() async {
      mockAppLink();
      await Sabowsla.initialize(
        url: sabowslaUrl,
        anonKey: sabowslaKey,
        debug: false,
        authOptions: FlutterAuthClientOptions(
          localStorage: MockEmptyLocalStorage(),
          pkceAsyncStorage: MockAsyncStorage(),
        ),
      );
    });

    test('initial session contains the error', () async {
      final event = await Sabowsla.instance.client.auth.onAuthStateChange.first;
      expect(event.event, AuthChangeEvent.initialSession);
      expect(event.session, isNull);
    });
  });

  group('Deep Link with PKCE code', () {
    late final PkceHttpClient pkceHttpClient;
    setUp(() async {
      pkceHttpClient = PkceHttpClient();

      // Add initial deep link with a `code` parameter
      mockAppLink(
        initialLink: 'com.sabowsla://callback/?code=my-code-verifier',
      );
      await Sabowsla.initialize(
        url: sabowslaUrl,
        anonKey: sabowslaKey,
        debug: false,
        httpClient: pkceHttpClient,
        authOptions: FlutterAuthClientOptions(
          localStorage: MockEmptyLocalStorage(),
          pkceAsyncStorage: MockAsyncStorage()
            ..setItem(
                key: 'sabowsla.auth.token-code-verifier',
                value: 'raw-code-verifier'),
        ),
      );
    });

    test(
        'Having `code` as the query parameter triggers `getSessionFromUrl` call on initialize',
        () async {
      expect(pkceHttpClient.requestCount, 1);
      expect(pkceHttpClient.lastRequestBody['auth_code'], 'my-code-verifier');
    });
  });
}
