import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_server/core/app_streams.dart';
import 'package:sabowsla_server/core/constants/export_ui_tools.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_button_icon.dart';

class DashboardRoutesDrawer extends StatefulWidget {
  const DashboardRoutesDrawer({super.key});

  @override
  State<DashboardRoutesDrawer> createState() => _DashboardRoutesDrawerState();
}

class _DashboardRoutesDrawerState extends State<DashboardRoutesDrawer> {
  List<RouteDrawer> routes = [
    RouteDrawer(
      icon: Icons.home,
      name: 'General',
      route: Routes.home,
    ),
    RouteDrawer(
      icon: Icons.group,
      name: 'Authentication',
      route: Routes.authentication,
    ),
    RouteDrawer(
      icon: FontAwesomeIcons.database,
      name: 'Database',
      route: Routes.database,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 200,
      padding: const EdgeInsets.all(5),
      duration: MyDurations.d1350,
      color: Colors.black38,
      child: Column(
        children: [
          ...routes.map(buildRoute),
        ],
      ),
    );
  }

  void setRoute(Routes route) {
    appStreams.routeStream.add(route);
  }

  Widget buildRoute(RouteDrawer route) {
    return StreamBuilder<Routes>(
      stream: appStreams.routeStream,
      builder: (context, snapshot) {
        var selectedRoute = appStreams.routeStream.value;
        return Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            children: [
              Expanded(
                child: CustomButtonIcon(
                  buttonText: route.name,
                  onTap: () {
                    setRoute(route.route);
                  },
                  icon: route.icon,
                  buttonColor: selectedRoute == route.route
                      ? Colors.deepPurple.shade900
                      : Colors.deepPurpleAccent.withOpacity(0.1),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
