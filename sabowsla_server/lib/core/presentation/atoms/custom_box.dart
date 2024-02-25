import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabowsla_cloud/core/extensions/context_extension.dart';

class CustomBox extends ConsumerWidget {
  const CustomBox({required this.size, super.key});
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: context.relative(size),
      width: context.relative(size),
    );
  }

  static Widget xSmall() => const CustomBox(size: 5);
  static Widget small() => const CustomBox(size: 10);
  static Widget medium() => const CustomBox(size: 20);
  static Widget large() => const CustomBox(size: 30);
  static Widget xLarge() => const CustomBox(size: 40);
  static Widget xxLarge() => const CustomBox(size: 50);
}
