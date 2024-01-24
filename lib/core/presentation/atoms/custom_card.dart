import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/constants/type_def.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.child, super.key, this.margin});
  final Widget child;
  final EI? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white24,
        ),
      ),
      child: child,
    );
  }
}
