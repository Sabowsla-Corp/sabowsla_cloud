import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        fontFamily: GoogleFonts.inter().fontFamily,
        colorScheme: const ColorScheme.dark(),
      ),
      home: const DashboardPage(),
    );
  }
}
