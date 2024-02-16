import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_page.dart';
import 'package:sabowsla_cloud/features/home/home_page.dart';
import 'package:sabowsla_cloud/features/home/views/create_project_view.dart';

var navigationService = NavigationService();

class NavigationService {
  var navigatorKey = GlobalKey<NavigatorState>();
  late final Provider<GoRouter> goRouterProvider = Provider<GoRouter>((ref) {
    return GoRouter(
      initialLocation: '/home',
      navigatorKey: navigatorKey,
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: '/dashboard',
          builder: (context, state) {
            return const DashboardPage();
          },
        ),
        GoRoute(
          path: CreateProjectView.routeName,
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
}
