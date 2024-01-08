import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_button_icon.dart';
import 'package:sabowsla_server/core/presentation/custom_image_base_64.dart';
import 'package:sabowsla_server/features/auth/controller/auth_controller.dart';
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

  void onSelectImage() async {
    var image = await authController.pickImageThumbnail();
    if (image != null) {
      userCredential.photoBase64 = image;
      log("Image selected and set");
      setState(() {});
    }
  }

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
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onSelectImage,
                    child: userCredential.photoBase64.isEmpty
                        ? const Icon(Icons.upload, size: 100)
                        : ImageBase64(
                            base64: userCredential.photoBase64,
                          ),
                  ),
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
