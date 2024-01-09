import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/extensions/context_extension.dart';
import 'package:sabowsla_server/features/auth/controller/auth_controller.dart';
import 'package:sabowsla_server/features/auth/presentation/users_page_view/users_page_view_header.dart';
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
    return Container(
      margin: const EdgeInsets.only(top: 30),
      constraints: BoxConstraints(maxWidth: context.width * 0.7),
      padding: const EdgeInsets.all(20),
      child: const Card(
        child: Column(
          children: [
            UsersPageViewHeader(),
            UsersPageViewUsersList(),
          ],
        ),
      ),
    );
  }
}
