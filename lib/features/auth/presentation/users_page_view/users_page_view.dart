import 'package:flutter/material.dart';
import 'package:sabowsla_server/features/auth/controller/auth_controller.dart';
import 'package:sabowsla_server/features/auth/presentation/users_page_view/users_page_view_users_list.dart';

class UsersPageView extends StatefulWidget {
  const UsersPageView({super.key});

  @override
  State<UsersPageView> createState() => _UsersPageViewState();
}

class _UsersPageViewState extends State<UsersPageView> {
  @override
  void initState() {
    super.initState();
    authController.loadRecentUsers();
  }

  @override
  Widget build(BuildContext context) {
    return const UsersPageViewUsersList();
  }
}
