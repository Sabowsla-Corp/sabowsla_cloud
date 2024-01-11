import 'package:flutter/material.dart';
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
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.all(10),
          child: Card(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Total Users ${authController.displayedUsers.value.length}",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const UsersPageViewHeader(),
                const UsersPageViewUsersList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
