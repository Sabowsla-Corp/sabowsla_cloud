import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sabowsla Server",
        ),
      ),
      body: Column(
        children: const [
          Text("Sabowsla Server Stats"),
        ],
      ),
    );
  }
}
