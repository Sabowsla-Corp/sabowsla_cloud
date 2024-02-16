import 'package:flutter/material.dart';

//Black rounded chip
class CustomChip extends StatelessWidget {
  const CustomChip({required this.label, super.key});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(color: Colors.white54),
      ),
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(155),
        side: const BorderSide(
          color: Colors.white10,
        ),
      ),
    );
  }
}
