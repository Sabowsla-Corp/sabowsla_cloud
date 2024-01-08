import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/extensions/context_extension.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_button_icon.dart';
import 'package:sabowsla_server/features/auth/presentation/views/users_page_view_header.dart';

class UsersPageView extends StatelessWidget {
  const UsersPageView({super.key});

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

class UsersPageViewUsersList extends StatelessWidget {
  const UsersPageViewUsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
