import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_server/core/app_streams.dart';
import 'package:sabowsla_server/core/constants/export_ui_tools.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_button_icon.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_divider.dart';
import 'package:sabowsla_server/gen/assets.gen.dart';

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
      name: 'Funtions',
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
                const ProjectIcon(),
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

  void setRoute(Routes route) {
    appStreams.routeStream.add(route);
  }

  Widget buildRoute(RouteDrawer route) {
    return StreamBuilder<Routes>(
      stream: appStreams.routeStream,
      builder: (context, snapshot) {
        var selectedRoute = appStreams.routeStream.value;
        bool selected = selectedRoute == route.route;
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
                  setRoute(route.route);
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

class ProjectIcon extends StatelessWidget {
  const ProjectIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Assets.userIcons.male.image(
          width: 40,
          height: 40,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
