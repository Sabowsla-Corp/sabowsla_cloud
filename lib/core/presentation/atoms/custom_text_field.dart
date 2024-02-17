import 'package:flutter/material.dart';
import 'package:sabowsla_cloud/core/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.trailing,
    super.key,
    this.controller,
    this.onChanged,
    this.textAlign,
    this.labelText,
    this.contentPadding,
    this.style,
    this.fillColor,
  });
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextAlign? textAlign;
  final String? labelText;
  final EdgeInsets? contentPadding;
  final TextStyle? style;
  final Color? fillColor;
  final Widget? trailing;

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
      style: style ?? styles10.white,
      textAlign: textAlign ?? TextAlign.center,
      decoration: InputDecoration(
        labelText: labelText,
        fillColor: fillColor ?? Colors.grey.shade900.withOpacity(0.5),
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: trailing,
      ),
    );
  }
}
