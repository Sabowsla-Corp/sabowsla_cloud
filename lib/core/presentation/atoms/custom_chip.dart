import 'package:flutter/material.dart';

//Black rounded chip
class CustomChip extends StatelessWidget {
  const CustomChip({required this.label, super.key, this.onTap});
  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(155),
        color: Colors.black,
        border: Border.all(
          color: Colors.white54,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(155),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Text(
              label,
              style: const TextStyle(color: Colors.white54),
            ),
          ),
        ),
      ),
    );
  }
}
