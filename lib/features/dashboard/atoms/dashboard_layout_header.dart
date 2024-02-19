import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_cloud/core/extensions/context_extension.dart';
import 'package:sabowsla_cloud/core/extensions/widget_ref_extensions.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_chip.dart';
import 'package:sabowsla_cloud/core/styles.dart';
import 'package:sabowsla_cloud/features/projects/atoms/current_user_avatar.dart';
import 'package:sabowsla_cloud/features/projects/models/project_model.dart';
import 'package:sabowsla_cloud/features/projects/projects_page_controller.dart';

class DashboardLayoutHeader extends ConsumerStatefulWidget {
  const DashboardLayoutHeader({required this.openProject, super.key});

  final ProjectModel openProject;

  @override
  ConsumerState<DashboardLayoutHeader> createState() =>
      _DashboardLayoutHeaderState();
}

class _DashboardLayoutHeaderState extends ConsumerState<DashboardLayoutHeader> {
  ProjectModel get openProject => widget.openProject;

  bool expandAllProjects = false;
  @override
  Widget build(BuildContext context) {
    List<ProjectModel> allProjects =
        ref.read(projectsPageControllerProvider).projects;
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(4),
                  onTap: () {
                    setState(() {
                      expandAllProjects = !expandAllProjects;
                    });
                  },
                  child: AnimatedRotation(
                    duration: Durations.medium1,
                    curve: Curves.easeInOut,
                    turns: expandAllProjects ? 0.25 : 0,
                    child: const Icon(
                      FontAwesomeIcons.caretRight,
                      color: Colors.white70,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  openProject.name,
                  style: styles24.white70.applyBold,
                ),
                const Spacer(),
                const CurrentUserAvatar(size: 24),
              ],
            ),
          ),
          AnimatedOpacity(
            duration: Durations.medium1,
            curve: Curves.easeInOut,
            opacity: expandAllProjects ? 1 : 0,
            child: AnimatedContainer(
              duration: Durations.medium1,
              width: context.width,
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(8),
              height: expandAllProjects ? 90 : 0,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.white10,
                  ),
                  bottom: BorderSide(
                    color: Colors.white10,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'All Projects',
                      style: styles16.white70.applyBold,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 30,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: allProjects.length,
                        separatorBuilder: (c, i) => const SizedBox(width: 5),
                        itemBuilder: (context, index) {
                          ProjectModel project = allProjects[index];
                          return CustomChip(
                            label: project.name,
                            onTap: () => ref.openProject(project),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
