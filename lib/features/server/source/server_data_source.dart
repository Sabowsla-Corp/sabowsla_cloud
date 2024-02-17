// ignore_for_file: avoid_print, unawaited_futures

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:sabowsla_cloud/features/auth/models/login_request_model.dart';
import 'package:sabowsla_cloud/features/auth/models/login_result_model.dart';

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
        InternetAddress.loopbackIPv4,
        serverSettings.port,
      );
      log("Starting server at host ${server!.address} port ${server!.port}");
      listenToServer(server!);
      var serverUrl = 'http://${server!.address.host}:${server!.port}';
      log("Server started at $serverUrl");
      return serverUrl;
    } catch (e) {
      log("Error starting server $e");
      return null;
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
          ..write('Welcome to Sabowsla Cloud Server')
          ..close();
      }
    }
  }

  Future<bool> loginEndPoint(HttpRequest request) async {
    bool called = request.uri.path == 'login';
    bool post = request.method == 'POST';
    try {
      if (post && called) {
        String content = await utf8.decoder.bind(request).join();
        var data = jsonDecode(content) as Map<String, dynamic>;

        var email = data['email'] as String;
        var password = data['password'] as String;
        var loginRequest = LoginRequest(email: email, password: password);
        LoginResult result = LoginResult.errored(
          LoginError.invalidEmail,
        ); // await authDataSource.login(loginRequest);
        if (result.error != null) {
          request.response.statusCode = 400;
          request.response.write(result.error);
          await request.response.close();
        } else {
          request.response.statusCode = 200;
          request.response.write(result.toJson());
          await request.response.close();
        }
      }
    } catch (e) {
      request.response.statusCode = 400;
      request.response.write("INTERNAL SERVER ERROR $e");
      await request.response.close();
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
