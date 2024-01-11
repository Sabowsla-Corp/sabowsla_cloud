import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/styles.dart';

class DashboardLayoutTemplate extends StatelessWidget {
  const DashboardLayoutTemplate({
    required this.title,
    required this.child,
    super.key,
  });
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: styles24.white.applyBold,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
