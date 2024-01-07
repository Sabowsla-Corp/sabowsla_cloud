import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_server/core/app_streams.dart';
import 'package:sabowsla_server/core/constants/export_ui_tools.dart';

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
                child: ElevatedButton(
                  onPressed: () => {
                    setRoute(route.route),
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedRoute == route.route
                        ? Colors.blueGrey
                        : Colors.black87,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Row(
                      children: [
                        Icon(
                          route.icon,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            route.name,
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
