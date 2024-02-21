import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_divider.dart';
import 'package:sabowsla_cloud/core/styles.dart';

class DashboardLayoutTemplate extends ConsumerWidget {
  const DashboardLayoutTemplate({
    required this.title,
    required this.child,
    this.trailing = const SizedBox(),
    super.key,
    this.icon,
    this.titleStyle,
    this.dividerColor,
    this.iconWidget,
    this.loader,
    this.showDefaultHeader = true,
    this.titleWidget,
  });
  final Widget? iconWidget;
  final IconData? icon;
  final String title;
  final Widget child;
  final Widget trailing;
  final TextStyle? titleStyle;
  final Color? dividerColor;
  final Widget? loader;
  final bool showDefaultHeader;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleWidget != null
            ? titleWidget!
            : Padding(
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
                    if (icon != null || iconWidget != null)
                      const SizedBox(width: 12),
                    Text(
                      title,
                      style: titleStyle ?? styles24.white70.applyBold,
                    ),
                    trailing,
                  ],
                ),
              ),
        CustomDivider(
          color: dividerColor,
        ),
        loader ?? const SizedBox(),
        const SizedBox(height: 10),
        Expanded(
          child: child,
        ),
      ],
    );
  }
}
