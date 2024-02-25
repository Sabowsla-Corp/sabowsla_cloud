import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sabowsla_cloud/core/constants/colors.dart';
import 'package:sabowsla_cloud/core/constants/type_def.dart';
import 'package:sabowsla_cloud/core/styles.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_page.dart';
import 'package:sabowsla_cloud/features/projects/projects_page.dart';
import 'package:sabowsla_cloud/features/projects/views/create_project_view.dart';
import 'package:shimmer/shimmer.dart';

var navigationService = NavigationService();

class NavigationService {
  var navigatorKey = GlobalKey<NavigatorState>();
  late final Provider<GoRouter> goRouterProvider = Provider<GoRouter>((ref) {
    return GoRouter(
      initialLocation: ProjectsPage.routeName,
      navigatorKey: navigatorKey,
      routes: [
        GoRoute(
          path: ProjectsPage.routeName,
          name: ProjectsPage.routeName,
          builder: (context, state) {
            return const ProjectsPage();
          },
        ),
        GoRoute(
          path: DashboardPage.routeName,
          name: DashboardPage.routeName,
          builder: (context, state) {
            return const DashboardPage();
          },
        ),
        GoRoute(
          path: CreateProjectView.routeName,
          name: CreateProjectView.routeName,
          builder: (context, state) {
            return const CreateProjectView();
          },
        ),
      ],
    );
  });

  void pop() {
    navigatorKey.currentState?.pop();
  }

  void showToast(String s) {
    showToastWidget(
      Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red.withOpacity(0.3)),
              color: colors.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              s,
              style: styles18.whiteBold,
            ),
          ),
          Container(
            padding: const EI.all(2),
            child: Shimmer.fromColors(
              baseColor: Colors.red.withOpacity(0.02),
              highlightColor: Colors.red.withOpacity(0.5),
              period: const Duration(milliseconds: 1000),
              loop: 1,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.red),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  s,
                  style: styles18.whiteBold,
                ),
              ),
            ),
          ),
        ],
      ),
      position: ToastPosition.top,
    );
  }
}
