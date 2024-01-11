import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_button_icon.dart';
import 'package:sabowsla_server/core/styles.dart';
import 'package:sabowsla_server/features/auth/controller/auth_controller.dart';

class UsersPageViewHeader extends StatefulWidget {
  const UsersPageViewHeader({super.key});

  @override
  State<UsersPageViewHeader> createState() => _UsersPageViewHeaderState();
}

class _UsersPageViewHeaderState extends State<UsersPageViewHeader> {
  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Colors.white24,
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
              style: styles14.white.applyW400,
              decoration: InputDecoration.collapsed(
                hintText: "Search for email, name, or UID",
                border: outlineInputBorder,
              ).copyWith(
                contentPadding: const EdgeInsets.all(10),
                enabledBorder: outlineInputBorder,
                errorBorder: outlineInputBorder,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const CreateUserButton(),
          const SizedBox(width: 10),
          CustomButtonIcon(
            icon: Icons.refresh,
            onTap: () {
              authController.loadRecentUsers();
            },
          ),
        ],
      ),
    );
  }
}

class CreateUserButton extends StatelessWidget {
  const CreateUserButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomButtonIcon(
        buttonText: "Add User",
        icon: Icons.add,
        onTap: () {
          authController.createUserModal(context);
        },
      ),
    );
  }
}
