import 'package:flutter/material.dart';
import 'package:sabowsla_server/features/auth/controller/auth_controller.dart';

import 'package:sabowsla_server/features/auth/presentation/auth_view_tabs.dart';
import 'package:sabowsla_server/features/auth/presentation/views/users_page_view.dart';

class AuthPageContentBuilder extends StatelessWidget {
  const AuthPageContentBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authController.currentTab,
      builder: (context, snapshot) {
        var currentTab = authController.currentTab.value;
        switch (currentTab) {
          case AuthViewTab.Users:
            return const UsersPageView();
          case AuthViewTab.Templates:
            return const UsersPageView();
          case AuthViewTab.Usage:
            return const UsersPageView();
          case AuthViewTab.Settings:
            return const UsersPageView();
          case AuthViewTab.Testing:
            return const UsersPageView();
        }
        return const UsersPageView();
      },
    );
  }
}
