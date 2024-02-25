import 'package:flutter/material.dart';
import 'package:sabowsla_cloud/features/auth/presentation/auth_view_tabs.dart';
import 'package:sabowsla_cloud/features/auth/presentation/testing_page_view/auth_testing_page_view.dart';
import 'package:sabowsla_cloud/features/auth/presentation/users_page_view/users_page_view.dart';

class AuthPageContentBuilder extends StatelessWidget {
  const AuthPageContentBuilder({required this.currentTab, super.key});
  final AuthViewTab currentTab;

  @override
  Widget build(BuildContext context) {
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
        return const AuthTestingPageView();
    }
  }
}
