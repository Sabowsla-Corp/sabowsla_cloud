// ignore_for_file: avoid_print

import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sabowsla_server/api/sabowsla_trinity_api.dart';
import 'package:sabowsla_server/features/dashboard/dashboard_page.dart';

void main() async {
  runApp(const ServerUI());
}

class ServerUI extends StatefulWidget {
  const ServerUI({super.key});

  @override
  State<ServerUI> createState() => _ServerUIState();
}

class _ServerUIState extends State<ServerUI> {
  @override
  void initState() {
    startRunningServer();
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0x0003fd47),
        ),
      ),
      navigatorKey: navi,
      darkTheme: ThemeData.dark(),
      home: const DashboardPage(),
    );
  }
}
