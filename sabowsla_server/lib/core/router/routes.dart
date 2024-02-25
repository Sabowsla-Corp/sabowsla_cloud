import 'package:flutter/material.dart';

enum Routes {
  home,
  authentication,
  database,
  firestore,
  functions,
  realtime,
  logs,
  settings,
  server
}

class RouteDrawer {
  RouteDrawer({required this.route, required this.name, required this.icon});

  final Routes route;
  final String name;
  final IconData icon;
}
