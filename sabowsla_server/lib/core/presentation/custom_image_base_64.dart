import 'dart:convert';

import 'package:flutter/material.dart';

class ImageBase64 extends StatelessWidget {
  const ImageBase64(
    this.base64, {
    super.key,
    this.width,
    this.height,
    this.onError,
  });
  final String base64;
  final double? width;
  final double? height;
  final Widget? onError;

  @override
  Widget build(BuildContext context) {
    var bytes = base64Decode(base64);
    return Image.memory(
      bytes,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return onError ??
            const Icon(Icons.image_not_supported, color: Colors.red);
      },
    );
  }
}
