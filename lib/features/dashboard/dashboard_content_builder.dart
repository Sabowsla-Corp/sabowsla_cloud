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
    switch (route) {
      case Routes.home:
        return getBaseLayout('General');
      case Routes.database:
        return getBaseLayout('Database');
      case Routes.authentication:
        return const AuthPage();
      case Routes.firestore:
        return getBaseLayout('Firestore');
      case Routes.functions:
        return getBaseLayout('Functions');
      case Routes.realtime:
        return getBaseLayout('Realtime');
      case Routes.logs:
        return getBaseLayout('Logs');
      case Routes.settings:
        return getBaseLayout('Settings');
    }
  }

  Widget getBaseLayout(String title) {
    return DashboardLayoutTemplate(
      title: title,
      // ignore: use_colored_box
      child: Container(
        color: Colors.black87,
        child: Center(
          child: Text(
            title,
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
