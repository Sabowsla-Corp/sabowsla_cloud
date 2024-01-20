import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/app_streams.dart';
import 'package:sabowsla_server/core/router/routes.dart';
import 'package:sabowsla_server/features/auth/presentation/auth_page.dart';
import 'package:sabowsla_server/features/dashboard/dashboard_layout_template.dart';

class DashboardContentView extends StatelessWidget {
  const DashboardContentView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(stream: appStreams.routeStream, builder: builder),
    );
  }

  Widget builder(c, s) {
    var route = appStreams.routeStream.value;
    switch (route.route) {
      case Routes.home:
        return getBaseLayout(route);
      case Routes.database:
        return getBaseLayout(route);
      case Routes.authentication:
        return const AuthPage();
      case Routes.firestore:
        return getBaseLayout(route);
      case Routes.functions:
        return getBaseLayout(route);
      case Routes.realtime:
        return getBaseLayout(route);
      case Routes.logs:
        return getBaseLayout(route);
      case Routes.settings:
        return getBaseLayout(route);
    }
  }

  Widget getBaseLayout(RouteDrawer route) {
    return DashboardLayoutTemplate(
      title: route.name,
      icon: route.icon,
      // ignore: use_colored_box
      child: Container(
        color: Colors.black87,
        child: Center(
          child: Text(
            route.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
