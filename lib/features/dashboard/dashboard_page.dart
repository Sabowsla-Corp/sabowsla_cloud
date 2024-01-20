import 'package:flutter/material.dart';
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
      backgroundColor: Colors.black,
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
