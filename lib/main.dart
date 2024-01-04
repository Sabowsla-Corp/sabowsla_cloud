import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sabowsla_server/features/home.dart';

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

      final requestPath = request.uri.path;
      int invokedFunctions = 0;
      for (var serverFunction in storageFunctions.props) {
        var functionPath = "/sf${serverFunction.name}";
        if (functionPath == requestPath) {
          serverFunction.method.then((value) {
            log("Server Function $functionPath Invoked with result $value");
            invokedFunctions++;

            request.response
              ..statusCode = 200
              ..write('Invoked $functionPath')
              ..close();
            return;
          });
        }
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
    return const MaterialApp(
      home: Home(),
    );
  }
}
