import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white24,
        ),
      ),
      child: child,
    );
  }
}
