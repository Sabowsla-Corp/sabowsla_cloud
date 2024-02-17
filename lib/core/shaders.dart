import 'package:flutter/material.dart';

class Shaders {
  Shader fadeTop(Rect bounds) {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Colors.transparent,
        Colors.white,
        Colors.white,
        Colors.transparent,
      ],
      stops: [0.0, 0.1, 0.9, 1.0],
    ).createShader(bounds);
  }

  Shader fadeTopBottom(Rect bounds) {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Colors.black,
        Colors.transparent,
        Colors.transparent,
        Colors.black,
      ],
      stops: [0.0, 0.05, 0.95, 1.0],
    ).createShader(bounds);
  }

  Shader fadeRight(Rect bounds) {
    return const LinearGradient(
      colors: <Color>[
        Colors.transparent,
        Colors.black,
      ],
      stops: [0.0, 1.0],
    ).createShader(bounds);
  }

  Shader fadeCenterTopBottom(Rect bounds) {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Colors.transparent,
        Colors.black,
        Colors.black,
        Colors.transparent,
      ],
      stops: [0.0, 0.1, 0.9, 1.0],
    ).createShader(bounds);
  }

  Shader fadeLeftRightShader(Rect bounds) {
    return const LinearGradient(
      colors: <Color>[
        Colors.black,
        Colors.transparent,
        Colors.transparent,
        Colors.black,
      ],
      stops: [0.0, 0.1, 0.9, 1.0],
    ).createShader(bounds);
  }

  Shader fadeLeftRightShaderInverse(Rect bounds, [List<double>? stops]) {
    return LinearGradient(
      colors: const <Color>[
        Colors.white10,
        Colors.white,
        Colors.white,
        Colors.white10,
      ],
      stops: stops ?? [0.0, 0.04, 0.96, 1.0],
    ).createShader(bounds);
  }
}

var shaders = Shaders();
