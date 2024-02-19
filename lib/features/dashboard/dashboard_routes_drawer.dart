import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_cloud/core/app_streams.dart';
import 'package:sabowsla_cloud/core/constants/export_ui_tools.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_button_icon.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_divider.dart';
import 'package:sabowsla_cloud/features/dashboard/atoms/sabowsla_cloud_logo_icon.dart';

class DashboardRoutesDrawer extends StatefulWidget {
  const DashboardRoutesDrawer({super.key});

  @override
  State<DashboardRoutesDrawer> createState() => _DashboardRoutesDrawerState();
}

class _DashboardRoutesDrawerState extends State<DashboardRoutesDrawer> {
  bool expanded = true;
  void toggleSize() {
    setState(() {
      expanded = !expanded;
    });
  }

  List<RouteDrawer> routes = [
    RouteDrawer(
      icon: Icons.home,
      name: 'General',
      route: Routes.home,
    ),
    RouteDrawer(
      icon: FontAwesomeIcons.lock,
      name: 'Authentication',
      route: Routes.authentication,
    ),
    RouteDrawer(
      icon: FontAwesomeIcons.database,
      name: 'Database',
      route: Routes.database,
    ),
    RouteDrawer(
      route: Routes.firestore,
      name: 'Storage',
      icon: FontAwesomeIcons.cloud,
    ),
    RouteDrawer(
      route: Routes.functions,
      name: 'Functions',
      icon: FontAwesomeIcons.connectdevelop,
    ),
    RouteDrawer(
      route: Routes.realtime,
      name: 'Realtime',
      icon: FontAwesomeIcons.bolt,
    ),
    RouteDrawer(
      route: Routes.logs,
      name: 'Logs',
      icon: FontAwesomeIcons.bars,
    ),
    RouteDrawer(
      route: Routes.server,
      name: 'Server',
      icon: FontAwesomeIcons.server,
    ),
    RouteDrawer(
      route: Routes.settings,
      name: 'Settings',
      icon: FontAwesomeIcons.gear,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: expanded ? 200 : 70,
      padding: const EdgeInsets.only(left: 5, top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                SabowslaCloudLogoIcon(expanded: expanded),
                const CustomDivider(),
                ListView.separated(
                  itemCount: routes.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 5),
                  itemBuilder: (context, index) => buildRoute(routes[index]),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          CustomDivider.vertical(
            onTap: toggleSize,
          ),
        ],
      ),
    );
  }

  void setRoute(RouteDrawer route) {
    appStreams.routeStream.add(route);
  }

  Widget buildRoute(RouteDrawer route) {
    return StreamBuilder<RouteDrawer>(
      stream: appStreams.routeStream,
      builder: (context, snapshot) {
        var selectedRoute = appStreams.routeStream.value;
        bool selected = selectedRoute.route == route.route;
        var buttonColor = selected ? Colors.white10 : Colors.black;
        var textStyle =
            TextStyle(color: selected ? Colors.white : Colors.white54);
        var iconColor = selected ? Colors.white : Colors.white54;
        return Row(
          children: [
            Expanded(
              child: CustomButtonIcon(
                buttonText: expanded ? route.name : null,
                onTap: () {
                  setRoute(route);
                },
                icon: route.icon,
                buttonColor: buttonColor,
                iconSize: 18,
                textStyle: textStyle,
                iconColor: iconColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
