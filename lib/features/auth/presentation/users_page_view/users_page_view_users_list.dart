import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_card.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_credential_card.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_menu_bar.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_pagination.dart';
import 'package:sabowsla_server/features/auth/controller/auth_controller.dart';
import 'package:sabowsla_server/features/auth/models/user_credential_model.dart';
import 'package:sabowsla_server/features/auth/presentation/users_page_view/users_page_view_header.dart';

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
        var segmentUsers = users.take(10).toList();

        return CustomCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Total Users ${authController.displayedUsers.value.length}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const UsersPageViewHeader(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: segmentUsers.length,
                itemBuilder: (c, i) =>
                    CustomCredentialCard(userCredential: segmentUsers[i]),
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
