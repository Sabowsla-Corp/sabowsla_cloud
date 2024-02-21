import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabowsla_cloud/core/app_streams.dart';
import 'package:sabowsla_cloud/core/extensions/enum_extensions.dart';
import 'package:sabowsla_cloud/features/dashboard/atoms/dashboard_tabs.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_layout_template.dart';
import 'package:sabowsla_cloud/features/dashboard/organisms/project_settings_card.dart';
import 'package:sabowsla_cloud/features/projects/projects_page_controller.dart';

class DashboardProjectSettingsPage extends ConsumerStatefulWidget {
  const DashboardProjectSettingsPage({super.key});

  @override
  ConsumerState<DashboardProjectSettingsPage> createState() =>
      _DashboardProjectSettingsPageState();
}

class _DashboardProjectSettingsPageState
    extends ConsumerState<DashboardProjectSettingsPage> {
  @override
  void initState() {
    super.initState();
    appStreams.loadingIndicator.add(false);
  }

  Enum selected = ProjectSettingsTabs.general;

  @override
  Widget build(BuildContext context) {
    var project = ref.read(openProjectProvider);
    return DashboardLayoutTemplate(
      title: "Project Settings",
      trailing: DashboardTabButtons(
        onTabChange: (value) {
          setState(() {
            selected = value;
          });
        },
        tabs: ProjectSettingsTabs.values,
        selected: selected,
      ),
      child: Column(
        children: [
          ProjectSettingsCard(project: project),
        ],
      ),
    );
  }
}
