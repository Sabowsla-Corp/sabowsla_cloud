import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:sabowsla_server/features/auth/models/user_credential_model.dart';
import 'package:sabowsla_server/features/auth/presentation/auth_view_tabs.dart';
import 'package:sabowsla_server/features/database/data_base_data_source.dart';

var authController = AuthController();

class AuthController {
  var displayedUsers = BehaviorSubject<List<UserCredential>>.seeded([]);
  var currentTab = BehaviorSubject<Enum>.seeded(AuthViewTab.Users);

  Future<void> loadRecentUsers() async {
    var users = await dataBaseDataSource.getUsers(offset: 0);
    displayedUsers.add(users);
  }

  Future<void> createUserModal(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return const SizedBox(
          height: 300,
          child: Center(
            child: Text('Create User'),
          ),
        );
      },
    );
  }
}
