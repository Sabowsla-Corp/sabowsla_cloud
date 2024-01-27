import 'package:flutter/material.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_credential_card.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_menu_bar.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_pagination.dart';
import 'package:sabowsla_cloud/core/styles.dart';
import 'package:sabowsla_cloud/features/auth/controller/auth_controller.dart';
import 'package:sabowsla_cloud/features/auth/models/user_credential_model.dart';
import 'package:sabowsla_cloud/features/auth/presentation/users_page_view/users_page_view_header.dart';

class UsersPageViewUsersList extends StatefulWidget {
  const UsersPageViewUsersList({super.key});

  @override
  State<UsersPageViewUsersList> createState() => _UsersPageViewUsersListState();
}

class _UsersPageViewUsersListState extends State<UsersPageViewUsersList> {
  int currentPage = 1;
  int totalPages = 3;
  int usersPerPage = 50;

  List<int> usersPerPageOptions = [10, 20, 50, 100, 1000];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserCredential>>(
      stream: authController.displayedUsers,
      builder: (context, snapshot) {
        var users = authController.displayedUsers.value;
        var segmentUsers = users.take(usersPerPage).toList();

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Users ${authController.displayedUsers.value.length}",
                style: styles24.white70.applyBold,
              ),
              const SizedBox(height: 10),
              const UsersPageViewHeader(),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: segmentUsers.length,
                  itemBuilder: (c, i) =>
                      CustomCredentialCard(userCredential: segmentUsers[i]),
                ),
              ),
              const SizedBox(height: 10),
              buildFooter(),
            ],
          ),
        );
      },
    );
  }

  Row buildFooter() {
    return Row(
      children: [
        CustomMenuBar.withTitle(
          title: 'Users per page',
          values: usersPerPageOptions,
          value: usersPerPage,
          onChanged: (newValue) {
            setState(() {
              usersPerPage = newValue;
            });
          },
        ),
        const Spacer(),
        CustomPagination.withTitle(
          current: currentPage,
          total: totalPages,
          title: 'Pagination',
        ),
      ],
    );
  }
}
