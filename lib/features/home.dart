import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Sabowsla Server",
        ),
      ),
      body: const Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text("Users"),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text("Storage Info"),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text("Running model"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
