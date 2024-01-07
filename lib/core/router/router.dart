// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/router/routes.dart';
import 'package:sabowsla_server/features/dashboard/dashboard_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  dynamic arguments = settings.arguments;

  switch (settings.name) {
    case '/':
      return _getPageRoute(const DashboardPage(), settings);

    case Routes.home:
      return _getPageRoute(const DashboardPage(), settings);

    default:
      return MaterialPageRoute(
        builder: (_) => const DashboardPage(),
      );
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return FadeRoute(child: child, routeName: settings.name!);
}

class FadeRoute extends PageRouteBuilder {
  FadeRoute({required this.child, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
  @override
  Duration get transitionDuration => const Duration(milliseconds: 550);

  final Widget child;
  final String routeName;
}
