import 'dart:io';

import 'package:sabowsla/sabowsla.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  /// Extracts a single request sent to the realtime server
  Future<HttpRequest> getRealtimeRequest({
    required HttpServer server,
    required SabowslaClient sabowslaClient,
  }) async {
    sabowslaClient.channel('name').subscribe();

    return server.first;
  }

  group('Standard Header', () {
    late String sabowslaUrl;
    const sabowslaKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im53emxkenlsb2pyemdqemloZHJrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQxMzI2ODAsImV4cCI6MTk5OTcwODY4MH0.MU-LVeAPic93VLcRsHktxzYtBKBUMWAQb8E-0AQETPs';
    late SabowslaClient sabowsla;
    late HttpServer mockServer;

    setUp(() async {
      mockServer = await HttpServer.bind('localhost', 0);
      sabowslaUrl = 'http://${mockServer.address.host}:${mockServer.port}';

      sabowsla = SabowslaClient(sabowslaUrl, sabowslaKey);
    });

    tearDown(() async {
      await sabowsla.removeAllChannels();
      await sabowsla.dispose();
    });

    test('X-Client-Info header is set properly on realtime', () async {
      final request = await getRealtimeRequest(
        server: mockServer,
        sabowslaClient: sabowsla,
      );

      final xClientHeaderBeforeSlash =
          request.headers['X-Client-Info']?.first.split('/').first;

      expect(xClientHeaderBeforeSlash, 'sabowsla-dart');
    });

    test('X-Client-Info header is set properly on storage', () {
      final xClientHeaderBeforeSlash =
          sabowsla.storage.headers['X-Client-Info']!.split('/').first;
      expect(xClientHeaderBeforeSlash, 'sabowsla-dart');
    });

    test('realtime URL is properly being set', () async {
      final request = await getRealtimeRequest(
        server: mockServer,
        sabowslaClient: sabowsla,
      );

      var realtimeWebsocketURL = request.uri;

      expect(
        realtimeWebsocketURL.queryParameters,
        containsPair('apikey', sabowslaKey),
      );
      expect(realtimeWebsocketURL.queryParameters['log_level'], isNull);
    });

    test('log_level query parameter is properly set', () async {
      sabowsla = SabowslaClient(sabowslaUrl, sabowslaKey,
          realtimeClientOptions:
              RealtimeClientOptions(logLevel: RealtimeLogLevel.info));

      final request = await getRealtimeRequest(
        server: mockServer,
        sabowslaClient: sabowsla,
      );

      final realtimeWebsocketURL = request.uri;

      expect(
        realtimeWebsocketURL.queryParameters,
        containsPair('apikey', sabowslaKey),
      );
      expect(
        realtimeWebsocketURL.queryParameters,
        containsPair('log_level', 'info'),
      );
    });

    test('realtime access token is set properly', () async {
      final request = await getRealtimeRequest(
        server: mockServer,
        sabowslaClient: sabowsla,
      );

      expect(request.uri.queryParameters['apikey'], sabowslaKey);
    });
  });

  group('auth', () {
    test('properly set Authorization header', () async {
      final (:sessionString, :accessToken) =
          getSessionData(DateTime.now().add(Duration(hours: 1)));

      final mockServer = await HttpServer.bind('localhost', 0);
      final sabowsla = SabowslaClient(
        'http://${mockServer.address.host}:${mockServer.port}',
        "sabowslaKey",
        authOptions: AuthClientOptions(autoRefreshToken: false),
      );
      await sabowsla.auth.recoverSession(sessionString);

      // Make some requests
      sabowsla.from("test").select().then((value) => null);
      sabowsla.rpc("test").select().then((value) => null);
      sabowsla.functions.invoke("test").then((value) => null);
      sabowsla.storage.from("test").list().then((value) => null);

      var count = 0;

      // Check for every request if the Authorization header is set properly
      await for (final req in mockServer) {
        expect(
            req.headers.value('Authorization')?.split(" ").last, accessToken);
        count++;
        if (count == 4) {
          break;
        }
      }

      mockServer.close();
    });

    test('call recoverSession', () async {
      final expiresAt = DateTime.now().add(Duration(seconds: 11));

      final mockServer = await HttpServer.bind('localhost', 0);
      final sabowsla = SabowslaClient(
        'http://${mockServer.address.host}:${mockServer.port}',
        "sabowslaKey",
        authOptions: AuthClientOptions(autoRefreshToken: false),
      );
      final sessionData = getSessionData(expiresAt);
      await sabowsla.auth.recoverSession(sessionData.sessionString);

      await Future.delayed(Duration(seconds: 11));

      // Make some requests
      sabowsla.from("test").select().then((value) => null);
      sabowsla.rpc("test").select().then((value) => null);
      sabowsla.functions.invoke("test").then((value) => null);
      sabowsla.storage.from("test").list().then((value) => null);

      var count = 0;
      var gotTokenRefresh = false;
      var secondAccessToken = "to be set";

      // Check for every request if the Authorization header is set properly
      await for (final req in mockServer) {
        if (req.uri.path == "/auth/v1/token") {
          if (gotTokenRefresh) {
            fail("Token was refreshed twice");
          }
          gotTokenRefresh = true;
          String sessionString;
          (accessToken: secondAccessToken, :sessionString) =
              getSessionData(DateTime.now().add(Duration(hours: 1)));

          req.response
            ..statusCode = HttpStatus.ok
            ..headers.contentType = ContentType.json
            ..write(sessionString)
            ..close();
        } else {
          expect(req.headers.value('Authorization')?.split(" ").last,
              secondAccessToken);
          count++;
          if (count == 4) {
            break;
          }
        }
      }

      mockServer.close();
    });
  });

  group('Custom Header', () {
    const sabowslaUrl = '';
    const sabowslaKey = '';
    late SabowslaClient sabowsla;

    setUp(() {
      sabowsla = SabowslaClient(
        sabowslaUrl,
        sabowslaKey,
        headers: {
          'X-Client-Info': 'sabowsla-flutter/0.0.0',
        },
      );
    });

    test('X-Client-Info header is set properly on realtime', () async {
      final mockServer = await HttpServer.bind('localhost', 0);

      final sabowsla = SabowslaClient(
        'http://${mockServer.address.host}:${mockServer.port}',
        sabowslaKey,
        headers: {
          'X-Client-Info': 'sabowsla-flutter/0.0.0',
        },
      );

      final request = await getRealtimeRequest(
        server: mockServer,
        sabowslaClient: sabowsla,
      );

      expect(request.headers['X-Client-Info']?.first, 'sabowsla-flutter/0.0.0');
    });

    test('X-Client-Info header is set properly on storage', () {
      final xClientInfoHeader = sabowsla.storage.headers['X-Client-Info'];
      expect(xClientInfoHeader, 'sabowsla-flutter/0.0.0');
    });
  });
}
