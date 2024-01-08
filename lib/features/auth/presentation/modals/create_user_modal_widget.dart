import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_button_icon.dart';
import 'package:sabowsla_server/features/auth/models/user_credential_model.dart';

class CreateUserModalWidget extends StatefulWidget {
  const CreateUserModalWidget({
    super.key,
  });

  @override
  State<CreateUserModalWidget> createState() => _CreateUserModalWidgetState();
}

class _CreateUserModalWidgetState extends State<CreateUserModalWidget> {
  UserCredential userCredential = UserCredential(
    displayName: "",
    email: "",
    uid: "",
    creationDate: "",
    photoBase64: "",
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 100,
                child: InkWell(
                  onTap: () {},
                  child: const Icon(Icons.upload, size: 100),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Name",
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Email",
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Password",
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          CustomButtonIcon(
            buttonText: "Create User",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
