import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabowsla_cloud/features/dashboard/atoms/dashboard_loading_indicator.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_content_builder.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_page_controller.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_routes_drawer.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({
    super.key,
  });

  static String routeName = "/dashboard";

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(dashboardPageControllerProvider.notifier).init();
    });
  }

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
