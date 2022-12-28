import 'package:sabowsla_server/models/stored_behavior.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServerStats {
  late StoredBehavior totalRequests;
  late StoredBehavior lastReceivedRequests;
  final SharedPreferences storage;
  ServerStats({required this.storage}) {
    totalRequests = StoredBehavior.singleInt('totalRequestsKey');
    lastReceivedRequests = StoredBehavior.stringList('lastReceivedRequestsKey');
  }
}
