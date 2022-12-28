import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/injection.dart';
import 'package:sabowsla_server/ui/styles.dart';

import '../models/server_stats_model.dart';

class ServerStatsView extends StatefulWidget {
  const ServerStatsView({
    Key? key,
  }) : super(key: key);

  @override
  State<ServerStatsView> createState() => _ServerStatsViewState();
}

class _ServerStatsViewState extends State<ServerStatsView> {
  var serverStats = locator<ServerStats>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.black87,
        padding: const EdgeInsets.only(left: 10, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<dynamic>(
              stream: serverStats.totalRequests.behaviorSubject.stream,
              builder: (context, snapshot) {
                int totalRequests = snapshot.data ?? 0;
                return Text(
                  "Total requests: $totalRequests",
                  style: Styles.white20,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
