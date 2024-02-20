import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.color});
  final Color? color;

  static Widget vertical({
    Function()? onTap,
  }) =>
      InkWell(
        onTap: onTap,
        mouseCursor: SystemMouseCursors.resizeColumn,
        child: const VerticalDivider(
          color: Colors.white24,
          thickness: 1,
          width: 10,
          endIndent: 0,
          indent: 0,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Divider(color: color ?? Colors.white24);
  }
}
