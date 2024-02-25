import 'package:flutter/material.dart';
import 'package:sabowsla_cloud/core/extensions/context_extension.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/cool_user_icons.dart';
import 'package:sabowsla_cloud/core/presentation/custom_image_base_64.dart';
import 'package:sabowsla_cloud/features/auth/models/user_credential_model.dart';

class CustomCredentialCard extends StatelessWidget {
  const CustomCredentialCard({required this.userCredential, super.key});
  final UserCredential userCredential;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      height: 50,
      width: context.relative(300),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ImageBase64(
              userCredential.photoBase64,
              width: 50,
              height: 50,
              onError: const CoolUserIcons(),
            ),
          ),
          const SizedBox(width: 10),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userCredential.displayName,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    userCredential.email,
                    style: const TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              //TODO: Implement user settings, maybe a dialog to delete user
            },
          ),
        ],
      ),
    );
  }
}
