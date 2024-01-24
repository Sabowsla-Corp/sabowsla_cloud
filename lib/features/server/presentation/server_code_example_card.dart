import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_card.dart';

class ServerCodeExampleCard extends StatelessWidget {
  const ServerCodeExampleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: CustomCard(
        child: Column(
          children: [
            Text('Server Code Example'),
            Text('This is a server code example card'),
          ],
        ),
      ),
    );
  }
}
