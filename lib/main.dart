import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sabowsla_cloud/features/auth/source/auth_data_source.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_page.dart';
import 'package:sabowsla_cloud/objectbox.dart';

import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
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
      navigatorKey: navigatorKey,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: const ColorScheme.dark(),
      ),
      home: const DashboardPage(),
      builder: (c, s) {
        return OKToast(child: s ?? Container());
      },
    );
  }
}

var navigatorKey = GlobalKey<NavigatorState>();
