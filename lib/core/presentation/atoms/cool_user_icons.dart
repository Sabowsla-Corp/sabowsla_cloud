import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sabowsla_cloud/gen/assets.gen.dart';

class CoolUserIcons extends StatelessWidget {
  const CoolUserIcons({super.key});

  @override
  Widget build(BuildContext context) {
    double size = 40;
    var index = Random().nextInt(Assets.userIcons.values.length);
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: SizedBox(
        width: size,
        height: size,
        child: Assets.userIcons.values[index].image(width: size, height: size),
      ),
    );
  }
}
