import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabowsla_server/features/auth/source/auth_data_source.dart';
import 'package:sabowsla_server/features/dashboard/dashboard_page.dart';
import 'package:sabowsla_server/objectbox.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var box = await ObjectBox.create();
  authDataSource.usersDb = box.usersDb;
  runApp(const ProviderScope(child: ServerUI()));
}

class ServerUI extends StatefulWidget {
  const ServerUI({super.key});

  @override
  State<ServerUI> createState() => _ServerUIState();
}

class _ServerUIState extends State<ServerUI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: const ColorScheme.dark(),
      ),
      home: const DashboardPage(),
    );
  }
}
