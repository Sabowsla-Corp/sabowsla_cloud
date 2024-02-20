import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_cloud/features/auth/controller/auth_page_controller.dart';
import 'package:sabowsla_cloud/features/auth/presentation/auth_view_content_builder.dart';
import 'package:sabowsla_cloud/features/auth/presentation/auth_view_tabs.dart';
import 'package:sabowsla_cloud/features/dashboard/atoms/dashboard_tabs.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_layout_template.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({
    super.key,
  });

  @override
  ConsumerState<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  @override
  Widget build(BuildContext context) {
    var currentTab = ref.watch(authPageControllerProvider).currentTab;

    return DashboardLayoutTemplate(
      title: 'Authentication',
      icon: FontAwesomeIcons.lock,
      trailing: DashboardTabButtons(
        tabs: AuthViewTab.values,
        selected: currentTab,
      ),
      child: AuthPageContentBuilder(currentTab: currentTab),
    );
  }
}
