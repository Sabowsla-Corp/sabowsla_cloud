import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/presentation/custom_image_base_64.dart';
import 'package:sabowsla_server/features/auth/models/user_credential_model.dart';

class UserCredentialProperty extends StatelessWidget {
  const UserCredentialProperty({
    required this.property,
    super.key,
    this.isImage = false,
  });
  final UIProperty property;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isImage ? 1 : 3,
      child: Container(
        margin: const EdgeInsets.only(right: 4, bottom: 2),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade900,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: isImage
            ? ImageBase64(property.property, width: 20, height: 20)
            : Row(
                children: [
                  Icon(
                    property.icon,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      property.property,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
