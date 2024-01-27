import 'package:flutter/material.dart';
import 'package:sabowsla_cloud/core/constants/type_def.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.child,
    super.key,
    this.margin,
    this.width,
    this.height,
    this.header,
  });
  final Widget? header;
  final Widget child;
  final double? width;
  final double? height;
  final EI? margin;

  @override
  Widget build(BuildContext context) {
    if (header != null) {
      return Container(
        margin: margin,
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: header,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey.shade800.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: child,
            ),
          ],
        ),
      );
    }
    return Container(
      margin: margin,
      width: width,
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
