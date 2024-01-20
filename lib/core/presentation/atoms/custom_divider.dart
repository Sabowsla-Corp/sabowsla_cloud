import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  static Widget vertical({
    Function()? onTap,
  }) =>
      InkWell(
        onTap: onTap,
        mouseCursor: SystemMouseCursors.resizeColumn,
        child: const VerticalDivider(
          color: Colors.white38,
          thickness: 1,
          width: 10,
          endIndent: 0,
          indent: 0,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return const Divider(color: Colors.white38);
  }
}
