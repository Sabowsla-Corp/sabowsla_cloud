import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_divider.dart';
import 'package:sabowsla_cloud/core/styles.dart';
import 'package:sabowsla_cloud/features/dashboard/atoms/dashboard_layout_header.dart';
import 'package:sabowsla_cloud/features/projects/models/project_model.dart';
import 'package:sabowsla_cloud/features/projects/projects_page_controller.dart';

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
  });
  final Widget? iconWidget;
  final IconData? icon;
  final String title;
  final Widget child;
  final Widget trailing;
  final TextStyle? titleStyle;
  final Color? dividerColor;
  final Widget? loader;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProjectModel? openProject =
        ref.read(projectsPageControllerProvider).selectedProject;

    Widget defaultHeadr = const SizedBox();
    if (openProject != null) {
      defaultHeadr = DashboardLayoutHeader(openProject: openProject);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        defaultHeadr,
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
        loader ?? const SizedBox(),
        const SizedBox(height: 10),
        Expanded(
          child: child,
        ),
      ],
    );
  }
}
