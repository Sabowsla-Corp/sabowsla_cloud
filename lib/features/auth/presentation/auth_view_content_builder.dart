import 'package:flutter/material.dart';
import 'package:sabowsla_server/features/auth/presentation/auth_controller.dart';

import 'package:sabowsla_server/features/auth/presentation/auth_view_tabs.dart';

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
            return const _UsersTab();
          case AuthViewTab.Templates:
            return const _UsersTab();
          case AuthViewTab.Usage:
            return const _UsersTab();
          case AuthViewTab.Settings:
            return const _UsersTab();
          case AuthViewTab.Testing:
            return const _UsersTab();
        }
        return const _UsersTab();
      },
    );
  }
}

class _UsersTab extends StatelessWidget {
  const _UsersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Users",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }
}
