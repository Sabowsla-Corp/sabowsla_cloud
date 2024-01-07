import 'package:rxdart/rxdart.dart';
import 'package:sabowsla_server/core/router/routes.dart';

var appStreams = AppStreams();

class AppStreams {
  var routeStream = BehaviorSubject<Routes>.seeded(Routes.home);
}
