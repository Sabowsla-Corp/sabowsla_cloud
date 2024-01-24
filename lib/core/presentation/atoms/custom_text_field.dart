import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.controller, this.onChanged});
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        color: Colors.white24,
      ),
    );
    return TextField(
      onChanged: onChanged,
      controller: controller,
      style: styles10.white,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade900.withOpacity(0.5),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
      ),
    );
  }
}
