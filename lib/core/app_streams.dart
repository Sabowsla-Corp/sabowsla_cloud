import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabowsla_cloud/core/router/routes.dart';

var appStreams = AppStreams();

class AppStreams {
  var routeStream = BehaviorSubject<RouteDrawer>.seeded(
    RouteDrawer(
      icon: Icons.home,
      name: 'General',
      route: Routes.home,
    ),
  );
  var loadingIndicator = BehaviorSubject<bool>.seeded(false);
}
