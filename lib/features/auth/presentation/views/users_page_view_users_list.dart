import 'package:flutter/material.dart';
import 'package:sabowsla_server/features/auth/models/user_credential_model.dart';
import 'package:sabowsla_server/features/auth/controller/auth_controller.dart';

class UsersPageViewUsersList extends StatelessWidget {
  const UsersPageViewUsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Column(
        children: [
          UsersListFirstHeaders(),
          UserListContentBuilder(),
        ],
      ),
    );
  }
}

class UserListContentBuilder extends StatelessWidget {
  const UserListContentBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserCredential>>(
      stream: authController.displayedUsers,
      builder: (context, snapshot) {
        var users = authController.displayedUsers.value;
        return Container(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (c, i) => UserRowInformation(user: users[i]),
          ),
        );
      },
    );
  }
}

class UserRowInformation extends StatelessWidget {
  const UserRowInformation({required this.user, super.key});
  final UserCredential user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            user.email,
          ),
        ),
        Expanded(
          child: Text(
            user.creationDate,
          ),
        ),
        Expanded(
          child: Text(
            user.uid,
          ),
        ),
      ],
    );
  }
}

/*
///
/// This is the first row of the users list
/// 
/// It contains the headers for the list
/// 
*/

class UsersListFirstHeaders extends StatelessWidget {
  const UsersListFirstHeaders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Text(
            "Email",
          ),
        ),
        Expanded(
          child: Text(
            "Date",
          ),
        ),
        Expanded(
          child: Text(
            "UID",
          ),
        ),
      ],
    );
  }
}
