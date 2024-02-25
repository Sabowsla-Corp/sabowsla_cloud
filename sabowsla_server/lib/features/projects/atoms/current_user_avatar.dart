import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabowsla_cloud/gen/assets.gen.dart';

class CurrentUserAvatar extends ConsumerWidget {
  const CurrentUserAvatar({super.key, this.size});
  final double? size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AvatarOutliner(
      padding: const EdgeInsets.all(4),
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Assets.userIcons.male.image(
          width: size ?? 30,
          height: size ?? 30,
        ),
      ),
    );
  }
}

class AvatarOutliner extends StatelessWidget {
  const AvatarOutliner({
    required this.child,
    this.padding = const EdgeInsets.all(0),
    this.onTap,
    super.key,
  });

  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    //Instagram like avatar outliner with color and inner padding
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      splashColor: Colors.red,
      highlightColor: Colors.red,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: SweepGradient(
              colors: [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.yellow,
              ],
            ),
          ),
          child: Container(
            padding: padding,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
