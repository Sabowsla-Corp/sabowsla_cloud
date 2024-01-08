import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_button_icon.dart';

class UsersPageViewHeader extends StatefulWidget {
  const UsersPageViewHeader({super.key});

  @override
  State<UsersPageViewHeader> createState() => _UsersPageViewHeaderState();
}

class _UsersPageViewHeaderState extends State<UsersPageViewHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 70,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Search",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: CustomButtonIcon(
              buttonText: "Add User",
              icon: Icons.add,
              onTap: () {},
            ),
          ),
          const SizedBox(width: 10),
          CustomButtonIcon(
            icon: Icons.refresh,
            onTap: () {},
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
