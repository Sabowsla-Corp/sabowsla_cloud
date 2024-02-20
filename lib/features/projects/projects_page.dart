import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_cloud/core/extensions/context_extension.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_box.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_button_icon.dart';
import 'package:sabowsla_cloud/core/styles.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_layout_template.dart';
import 'package:sabowsla_cloud/features/projects/atoms/create_project_card.dart';
import 'package:sabowsla_cloud/features/projects/atoms/current_user_avatar.dart';
import 'package:sabowsla_cloud/features/projects/atoms/project_card_preview.dart';
import 'package:sabowsla_cloud/features/projects/models/project_model.dart';
import 'package:sabowsla_cloud/features/projects/projects_page_controller.dart';

class ProjectsPage extends ConsumerStatefulWidget {
  const ProjectsPage({super.key});

  static const routeName = "/projects";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends ConsumerState<ProjectsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(projectsPageControllerProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    //var state = ref.watch(homePageControllerProvider);
    return DashboardLayoutTemplate(
      title: "Sabowsla Cloud",
      showDefaultHeader: false,
      titleStyle: styles18.white,
      iconWidget: const Padding(
        padding: EdgeInsets.only(left: 5),
        child: Icon(
          FontAwesomeIcons.cloud,
          size: 20,
        ),
      ),
      dividerColor: Colors.transparent,
      trailing: Container(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: [
            CustomButtonIcon.transparent(
              icon: FontAwesomeIcons.solidBell,
              onTap: () {},
              iconSize: 18,
            ),
            const SizedBox(width: 5),
            const CurrentUserAvatar(),
          ],
        ),
      ),
      child: const ProjectsPageContent(),
    );
  }
}

class ProjectsPageContent extends ConsumerWidget {
  const ProjectsPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ProjectModel> currentProjects =
        ref.watch(projectsPageControllerProvider).projects;

    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: context.width * 0.8,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Projectos recientes",
                  style: styles18.whiteBold,
                ),
                CustomBox.medium(),
                GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  children: [
                    const CreateProjectCard(),
                    ...currentProjects.map(
                      (project) => ProjectCardPreview(
                        project: project,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
