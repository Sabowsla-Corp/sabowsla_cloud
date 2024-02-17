import 'package:flutter/material.dart';
import 'package:sabowsla_cloud/core/extensions/context_extension.dart';
import 'package:sabowsla_cloud/core/shaders.dart';
import 'package:shimmer/shimmer.dart';

class CustomLinearLoadingProgressShimmer extends StatelessWidget {
  const CustomLinearLoadingProgressShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (r) {
        return shaders.fadeLeftRightShaderInverse(r, [
          0,
          0.3,
          0.7,
          1,
        ]);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: context.width,
          child: Shimmer.fromColors(
            loop: 100000,
            period: const Duration(milliseconds: 1000),
            baseColor: Colors.deepPurpleAccent.withOpacity(0.5),
            highlightColor: Colors.pinkAccent.withOpacity(0.9),
            child: Container(
              color: Colors.white,
              child: const Text(
                "Loading",
                style: TextStyle(
                  fontSize: 5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
