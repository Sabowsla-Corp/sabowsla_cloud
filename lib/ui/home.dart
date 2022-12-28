import 'package:flutter/material.dart';
import 'package:sabowsla_server/ui/server_stats_view.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Sabowsla Server",
        ),
      ),
      body: Row(
        children: [
          const ServerStatsView(),
          Expanded(
            child: Column(
              children: const [
                Text("Users"),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: const [
                Text("Storage Info"),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: const [
                Text("Running model"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
