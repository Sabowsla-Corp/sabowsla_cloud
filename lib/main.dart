import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sabowsla_cloud/core/router.dart';
import 'package:sabowsla_cloud/features/projects/projects_data_source.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  log("Running app");
  var projectsDataSource = ProjectsDataSource();
  runApp(
    ProviderScope(
      overrides: [
        projectsDataSourceProvider.overrideWith((ref) => projectsDataSource),
      ],
      child: const ServerUI(),
    ),
  );
}

class ServerUI extends ConsumerWidget {
  const ServerUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log("Server rezied");
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: ref.read(navigationService.goRouterProvider),
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: const ColorScheme.dark(),
      ),
      builder: (c, s) {
        return OKToast(child: s ?? Container());
      },
    );
  }
}

var navigatorKey = GlobalKey<NavigatorState>();
