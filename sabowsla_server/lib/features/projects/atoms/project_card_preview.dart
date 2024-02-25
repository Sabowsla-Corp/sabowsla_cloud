import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_box.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_card.dart';
import 'package:sabowsla_cloud/core/styles.dart';
import 'package:sabowsla_cloud/features/projects/models/project_model.dart';
import 'package:sabowsla_cloud/features/projects/projects_page_controller.dart';

class ProjectCardPreview extends ConsumerWidget {
  const ProjectCardPreview({required this.project, super.key});
  final ProjectModel project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomCard(
      onTap: () {
        ref.read(projectsPageControllerProvider.notifier).openProject(project);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(project.name, style: styles16.whiteBold),
          CustomBox.xSmall(),
          Text(project.uid, style: styles12.white),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(project.createdAtFormattedShort, style: styles12.white54),
            ],
          ),
        ],
      ),
    );
  }
}
