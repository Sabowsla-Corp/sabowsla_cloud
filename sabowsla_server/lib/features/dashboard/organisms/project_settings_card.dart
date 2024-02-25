import 'package:flutter/material.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_card.dart';
import 'package:sabowsla_cloud/features/projects/models/project_model.dart';

class ProjectSettingsCard extends StatelessWidget {
  const ProjectSettingsCard({super.key, this.project});
  final ProjectModel? project;

  @override
  Widget build(BuildContext context) {
    return const CustomCard(
      child: Column(
        children: [
          Text(
            "Project Settings",
          ),
        ],
      ),
    );
  }
}
