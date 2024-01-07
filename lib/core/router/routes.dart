import 'package:flutter/material.dart';

enum Routes {
  home,
  authentication,
  database,
}

class RouteDrawer {
  RouteDrawer({required this.route, required this.name, required this.icon});

  final Routes route;
  final String name;
  final IconData icon;
}
