import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/app_streams.dart';
import 'package:sabowsla_server/core/router/routes.dart';
import 'package:sabowsla_server/features/dashboard/dashboard_layout_template.dart';
import 'package:sabowsla_server/features/auth/presentation/auth_page.dart';

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
        // ignore: use_colored_box
        return Container(
          color: Colors.black87,
          child: const Center(
            child: Text(
              "Home",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        );

      case Routes.database:
        return DashboardLayoutTemplate(
          title: 'Database',
          // ignore: use_colored_box
          child: Container(
            color: Colors.black87,
            child: const Center(
              child: Text(
                "Database",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        );
      case Routes.authentication:
        return const AuthPage();
    }
  }
}
