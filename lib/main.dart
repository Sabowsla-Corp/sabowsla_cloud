import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:sabowsla_server/core/server_funtions.dart';
import 'package:sabowsla_server/core/injection.dart';
import 'package:sabowsla_server/ui/home.dart';

void main() async {
  injectDependencies();
  runApp(const ServerUI());
}

class ServerUI extends StatefulWidget {
  const ServerUI({super.key});

  @override
  State<ServerUI> createState() => _ServerUIState();
}

class _ServerUIState extends State<ServerUI> {
  var lastRequest = BehaviorSubject<String?>.seeded(null);

  @override
  void initState() {
    startRunningServer();
    super.initState();
  }

  void startRunningServer() async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
    print('Listening on localhost:${server.port}');

    var sf = locator<ServerFunctions>();

    await for (HttpRequest request in server) {
      lastRequest.add(request.uri.toString());
      final path = request.uri.path;
      if (path == '/save_image') {
        sf.saveFile();
      } else if (path == '/get_file_list') {
        sf.saveFile();
      } else if (path == '/delete_image') {
        sf.saveFile();
      } else {
        request.response
          ..statusCode = 404
          ..write('Not found')
          ..close();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
