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
            itemBuilder: (c, i) => Row(
              children: [
                ...users[i].propertiesAsWidgets,
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    authController.deleteUser(users[i].uid);
                  },
                ),
              ],
            ),
          ),
        );
      },
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
          flex: 3,
          child: Text(
            "UID",
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            "Name",
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            "Email",
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            "Creation Date",
          ),
        ),
        Expanded(
          child: Text(
            "Photo",
          ),
        ),
      ],
    );
  }
}
