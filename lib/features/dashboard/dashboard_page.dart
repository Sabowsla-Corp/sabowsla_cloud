import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabowsla_server/core/app_streams.dart';
import 'package:sabowsla_server/features/dashboard/dashboard_content_builder.dart';
import 'package:sabowsla_server/features/dashboard/dashboard_routes_drawer.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Sabowsla Server",
          style: TextStyle(
            fontFamily: GoogleFonts.delaGothicOne().fontFamily,
          ),
        ),
      ),
      body: Column(
        children: [
          StreamBuilder<bool>(
            stream: appStreams.loadingIndicator,
            builder: (c, s) {
              bool show = s.data ?? false;
              if (show) {
                return const LinearProgressIndicator();
              } else {
                return const SizedBox();
              }
            },
          ),
          const Expanded(
            child: Row(
              children: [
                DashboardRoutesDrawer(),
                DashboardContentView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
