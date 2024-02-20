import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_button_icon.dart';
import 'package:sabowsla_cloud/core/styles.dart';
import 'package:sabowsla_cloud/features/auth/controller/auth_page_controller.dart';
import 'package:sabowsla_cloud/features/auth/presentation/modals/create_user_modal_widget.dart';

class UsersPageViewHeader extends ConsumerStatefulWidget {
  const UsersPageViewHeader({super.key});

  @override
  ConsumerState<UsersPageViewHeader> createState() =>
      _UsersPageViewHeaderState();
}

class _UsersPageViewHeaderState extends ConsumerState<UsersPageViewHeader> {
  @override
  Widget build(BuildContext context) {
    var authController = ref.read(authPageControllerProvider.notifier);
    var outlineInputBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Colors.white24,
      ),
    );
    return Row(
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
          showDialog(
            context: context,
            builder: (c) {
              return const CreateUserModalWidget();
            },
          );
        },
      ),
    );
  }
}
