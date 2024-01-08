import 'package:flutter/material.dart';
import 'package:sabowsla_server/features/auth/models/user_credential_model.dart';

class UserRowInformation extends StatelessWidget {
  const UserRowInformation({required this.user, super.key});
  final UserCredential user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            user.email.isEmpty ? "No email" : user.email,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Text(
            user.displayName.isEmpty ? "No name" : user.displayName,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Text(
            user.uid.isEmpty ? "No UID" : user.uid,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
