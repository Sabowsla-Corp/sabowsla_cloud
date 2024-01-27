import 'package:flutter/material.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_divider.dart';
import 'package:sabowsla_cloud/core/styles.dart';

class DashboardLayoutTemplate extends StatelessWidget {
  const DashboardLayoutTemplate({
    required this.title,
    required this.child,
    this.trailing = const SizedBox(),
    super.key,
    this.icon,
  });
  final IconData? icon;
  final String title;
  final Widget child;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8),
          child: Row(
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.white70,
                  size: 20,
                ),
              if (icon != null) const SizedBox(width: 12),
              Text(
                title,
                style: styles24.white70.applyBold,
              ),
              const Spacer(),
              trailing,
            ],
          ),
        ),
        const CustomDivider(),
        const SizedBox(height: 10),
        Expanded(
          child: child,
        ),
      ],
    );
  }
}
