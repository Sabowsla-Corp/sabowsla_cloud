import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/constants/export_ui_tools.dart';

class DashboardRoutesDrawer extends StatefulWidget {
  const DashboardRoutesDrawer({super.key});

  @override
  State<DashboardRoutesDrawer> createState() => _DashboardRoutesDrawerState();
}

class _DashboardRoutesDrawerState extends State<DashboardRoutesDrawer> {
  List<RouteDrawer> routes = [
    RouteDrawer(icon: Icons.home, name: 'Home', route: Routes.home),
    RouteDrawer(icon: Icons.person, name: 'Users', route: Routes.users),
    RouteDrawer(
      icon: Icons.content_paste,
      name: 'Content',
      route: Routes.content,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 150,
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

  void setRoute(String route) {
    routeStream.add(route);
  }

  Widget buildRoute(RouteDrawer route) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => {
                setRoute(route.route),
              },
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
                        overflow: TextOverflow.fade,
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
  }
}
