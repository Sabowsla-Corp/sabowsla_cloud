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
    var outlineInputBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Colors.deepPurpleAccent,
      ),
    );
    return Container(
      padding: const EdgeInsets.all(10),
      height: 70,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search for email, name, or UID",
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                border: outlineInputBorder,
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: CustomButtonIcon(
              buttonText: "Add User",
              icon: Icons.add,
              buttonColor: Colors.deepPurple,
              onTap: () {},
            ),
          ),
          const SizedBox(width: 10),
          CustomButtonIcon(
            icon: Icons.refresh,
            onTap: () {},
            buttonColor: Colors.deepPurple,
          ),
        ],
      ),
    );
  }
}
