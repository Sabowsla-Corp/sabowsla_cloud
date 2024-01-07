import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class Routes {
  static const String home = '/users';
  static const String users = '/users';
  static const String content = '/content';
}

class RouteDrawer {
  RouteDrawer({required this.route, required this.name, required this.icon});

  final String route;
  final String name;
  final IconData icon;
}

var routeStream = BehaviorSubject<String>.seeded(Routes.home);
