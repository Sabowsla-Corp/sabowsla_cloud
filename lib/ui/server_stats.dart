import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabowsla_server/ui/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServerStats {
  late BehaviorSubject<int> totalRequests;

  ServerStats() {
    totalRequests = BehaviorSubject<int>.seeded(savedRequestsCount());
  }

  Future<int> savedRequestsCount() async  {
    var prefs = await SharedPreferences.getInstance();
    return prefs.get
  }
}

class ServerStatsView extends StatelessWidget {
  const ServerStatsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.black87,
        padding: const EdgeInsets.only(left: 10, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total requests:",
              style: Styles.white20,
            ),
          ],
        ),
      ),
    );
  }
}
