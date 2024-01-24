// ignore_for_file: avoid_print, unawaited_futures

import 'dart:developer';
import 'dart:io';
import 'package:sabowsla_server/api/sabowsla_trinity_api.dart';

var sabowslaServer = SabowslaServer();

class SabowslaServer {
  void startRunningServer() async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
    print('Listening on localhost:${server.port}');

    await for (HttpRequest request in server) {
      log("Request received ${request.uri}");

      final requestedApi = request.uri.path;
      int invokedFunctions = 0;
      if (requestedApi == 'generateImage') {
        var prompt = request.uri.queryParameters['prompt'] ?? '';
        var image = await SabowslaTrinityApi().generateImage(prompt);
        invokedFunctions++;
        request.response
          ..statusCode = 200
          ..write(image)
          ..close();
        return;
      }

      if (invokedFunctions == 0) {
        request.response
          ..statusCode = 404
          ..write('Not found')
          ..close();
        return;
      }
    }
  }
}
