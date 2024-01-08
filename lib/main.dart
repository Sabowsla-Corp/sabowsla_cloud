import 'package:flutter/material.dart';
import 'package:sabowsla_server/features/dashboard/dashboard_page.dart';
import 'package:sabowsla_server/features/server/sabowsla_server.dart';

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
    sabowslaServer.startRunningServer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          // ColorScheme.dark is deprecated
          primary: Colors.deepPurple,
          secondary: Colors.red,
          secondaryContainer: Colors.red,
          primaryContainer: Colors.red,
          surface: Color.fromARGB(255, 8, 5, 26),
          onPrimary: Colors.red,
          onSecondary: Colors.red,
        ),
      ),
      home: const DashboardPage(),
    );
  }
}
