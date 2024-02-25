import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  ColorFilter toFilter() {
    return ColorFilter.mode(this, BlendMode.srcIn);
  }
}
