// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_button_icon.dart';
import 'package:sabowsla_cloud/core/presentation/custom_image_base_64.dart';
import 'package:sabowsla_cloud/features/auth/controller/auth_page_controller.dart';
import 'package:sabowsla_core/sabowsla_core.dart';

class CreateUserModalWidget extends ConsumerStatefulWidget {
  const CreateUserModalWidget({
    super.key,
  });

  @override
  ConsumerState<CreateUserModalWidget> createState() =>
      _CreateUserModalWidgetState();
}

class _CreateUserModalWidgetState extends ConsumerState<CreateUserModalWidget> {
  var loading = false;
  var loadingImage = false;
  RegisterResult? registerResult;
  var passwordController = TextEditingController();
  var emailController = TextEditingController(text: "jhon@gmail.com");
  var nameController = TextEditingController();
  UserCredential userCredential = UserCredential(
    displayName: "",
    email: "",
    uid: "",
    creationDate: DateTime.now(),
    photoBase64: "",
  );

  void onSelectImage() async {
    loadingImage = true;
    setState(() {});
    var image = await ref
        .read(authPageControllerProvider.notifier)
        .pickImageThumbnail();
    if (image != null) {
      userCredential.photoBase64 = image;
      loadingImage = false;
      setState(() {});
    }
  }

  void onCreateUser() async {
    loading = true;
    setState(() {});
    var passwordHash = hashPassword(passwordController.text);
    userCredential.passwordHash = passwordHash;
    userCredential.email = emailController.text;
    userCredential.displayName = nameController.text;
    registerResult = await ref
        .read(authPageControllerProvider.notifier)
        .createUser(userCredential);
    if (registerResult?.error == null) {
      popModal();
    } else {
      print("Error creating user: ${registerResult?.error}");
    }
    loading = false;
    setState(() {});
  }

  String hashPassword(String password) {
    List<int> passwordBytes = utf8.encode(password);
    Digest sha256Hash = sha256.convert(passwordBytes);
    return sha256Hash.toString();
  }

  void popModal() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 280),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Material(
                          color: Colors.transparent,
                          child: loadingImage
                              ? const Center(
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: onSelectImage,
                                  child: userCredential.photoBase64.isEmpty
                                      ? const Icon(Icons.upload, size: 100)
                                      : ImageBase64(userCredential.photoBase64),
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
                                    controller: nameController,
                                    decoration: const InputDecoration(
                                      hintText: "Name",
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextFormField(
                                    controller: emailController,
                                    decoration: const InputDecoration(
                                      hintText: "Email",
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
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
                                    controller: passwordController,
                                    decoration: const InputDecoration(
                                      hintText: "Password",
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
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
                const Spacer(),
                CustomButtonIcon(
                  buttonText: "Create User",
                  onTap: loading ? null : onCreateUser,
                  loading: loading,
                  buttonColor: loading
                      ? Colors.grey.shade900
                      : Colors.deepPurple.shade900,
                ),
                AnimatedContainer(
                  duration: Durations.short1,
                  height: registerResult != null ? 25 : 0,
                  child: registerResult != null
                      ? Text(
                          registerResult!.error?.name ?? "",
                          style: const TextStyle(color: Colors.red),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
