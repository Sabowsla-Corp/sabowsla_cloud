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
    this.titleStyle,
    this.dividerColor,
    this.iconWidget,
  });
  final Widget? iconWidget;
  final IconData? icon;
  final String title;
  final Widget child;
  final Widget trailing;
  final TextStyle? titleStyle;
  final Color? dividerColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8),
          child: Row(
            children: [
              if (iconWidget != null) iconWidget!,
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.white70,
                  size: 20,
                ),
              if (icon != null || iconWidget != null) const SizedBox(width: 12),
              Text(
                title,
                style: titleStyle ?? styles24.white70.applyBold,
              ),
              const Spacer(),
              trailing,
            ],
          ),
        ),
        CustomDivider(
          color: dividerColor,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: child,
        ),
      ],
    );
  }
}
