// ignore_for_file: avoid_print, unawaited_futures

import 'dart:developer';
import 'dart:io';
import 'package:sabowsla_server/features/auth/models/login_request_model.dart';
import 'package:sabowsla_server/features/auth/source/auth_data_source.dart';

var sabowslaServer = SabowslaServer();

class SabowslaServer {
  ServerSettings serverSettings = ServerSettings.defaultSettings();
  HttpServer? server;

  Future<bool> stop() async {
    try {
      await server?.close(force: true);
      server = null;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> start(
    ServerSettings? settings,
  ) async {
    try {
      serverSettings = settings ?? serverSettings;
      server = await HttpServer.bind(
        InternetAddress.loopbackIPv6,
        serverSettings.port,
      );
      listenToServer(server!);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  void listenToServer(HttpServer server) async {
    await for (HttpRequest request in server) {
      log("Request received ${request.uri}");

      int invokedFunctions = 0;
      bool calledLogin = await loginEndPoint(request);
      invokedFunctions += calledLogin ? 1 : 0;

      if (invokedFunctions == 0) {
        request.response
          ..statusCode = 404
          ..write('Not found')
          ..close();
      }
    }
  }

  Future<bool> loginEndPoint(HttpRequest request) async {
    bool called = request.uri.path == 'login';
    if (called) {
      var email = request.uri.queryParameters['email'] ?? '';
      var password = request.uri.queryParameters['password'] ?? '';
      var loginRequest = LoginRequest(email: email, password: password);
      var token = await authDataSource.login(loginRequest);
      request.response
        ..statusCode = 200
        ..write(token)
        ..close();
    }
    return called;
  }
}

class ServerSettings {
  ServerSettings({
    required this.cors,
    required this.port,
    required this.verbose,
    required this.jwtSecret,
  });
  final bool cors;
  final int port;
  final bool verbose;
  final String jwtSecret;

  static ServerSettings defaultSettings() {
    return ServerSettings(
      cors: false,
      port: 1203,
      verbose: false,
      jwtSecret: 'REPLACE-WITH-YOUR-SECRET-KEY',
    );
  }
}
