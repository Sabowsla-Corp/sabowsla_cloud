// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sabowsla_server/features/auth/presentation/auth_controller.dart';
import 'package:sabowsla_server/features/dashboard/atoms/dashboard_tabs.dart';

class AuthPageTabs extends StatelessWidget {
  const AuthPageTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Enum>(
      stream: authController.currentTab,
      builder: (context, snapshot) {
        return DashboardTabButtons(
          tabs: AuthViewTab.values,
          selected: authController.currentTab.value,
        );
      },
    );
  }
}

enum AuthViewTab {
  Users,
  Templates,
  Usage,
  Settings,
  Testing,
}
