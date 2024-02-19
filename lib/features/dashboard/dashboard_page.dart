import 'package:flutter/material.dart';
import 'package:sabowsla_cloud/features/dashboard/atoms/dashboard_loading_indicator.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_content_builder.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_routes_drawer.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    super.key,
  });

  static String routeName = "/dashboard";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          DashboardLoadingIndicator(),
          Expanded(
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
