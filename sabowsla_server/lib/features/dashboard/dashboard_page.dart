import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabowsla_cloud/features/dashboard/atoms/dashboard_layout_header.dart';
import 'package:sabowsla_cloud/features/dashboard/atoms/dashboard_loading_indicator.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_content_builder.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_page_controller.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_routes_drawer.dart';
import 'package:sabowsla_cloud/features/projects/models/project_model.dart';
import 'package:sabowsla_cloud/features/projects/projects_page_controller.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({
    super.key,
  });

  static String routeName = "/dashboard";

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  void get showDefaultHeader {}

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(dashboardPageControllerProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    ProjectModel? openProject =
        ref.read(projectsPageControllerProvider).selectedProject;

    Widget defaultHeadr = const SizedBox();
    if (openProject != null) {
      defaultHeadr = DashboardLayoutHeader(openProject: openProject);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const DashboardLoadingIndicator(),
          defaultHeadr,
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
