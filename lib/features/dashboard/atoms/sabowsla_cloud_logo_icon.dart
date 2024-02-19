import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabowsla_cloud/core/extensions/widget_ref_extensions.dart';
import 'package:sabowsla_cloud/features/projects/projects_page.dart';
import 'package:sabowsla_cloud/gen/assets.gen.dart';

class SabowslaCloudLogoIcon extends ConsumerWidget {
  const SabowslaCloudLogoIcon({required this.expanded, super.key});
  final bool expanded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!expanded) return const SizedBox();
    return Row(
      children: [
        InkWell(
          onTap: () {
            ref.router.goNamed(ProjectsPage.routeName);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Assets.icon.icon.image(
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 10),
        const FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'Sabowsla Cloud',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
