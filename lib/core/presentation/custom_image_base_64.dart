import 'dart:convert';

import 'package:flutter/material.dart';

class ImageBase64 extends StatelessWidget {
  const ImageBase64({required this.base64, super.key});
  final String base64;

  @override
  Widget build(BuildContext context) {
    var bytes = base64Decode(base64);
    return Image.memory(bytes);
  }
}
