import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

extension ContextExtesion on BuildContext {
  double get longestSide => MediaQuery.sizeOf(this).longestSide;
  double get shortestSide => MediaQuery.sizeOf(this).shortestSide;
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
  Orientation get orientation => MediaQuery.of(this).orientation;
  bool get isHorizontal => orientation == Orientation.landscape;
  bool get isVertical => orientation == Orientation.portrait;

  @Deprecated('Use ref.relative instead')
  double relative(double s) {
    if (isIpad) {
      return shortestSide * getTabletSize(s);
    }
    return shortestSide * getMobileSize(s);
  }

  bool get isIpad {
    Size size = MediaQuery.sizeOf(this);
    return getDeviceType(size) == DeviceScreenType.tablet ||
        getDeviceType(size) == DeviceScreenType.desktop;
  }
}

double getMobileSize(double fSize) => (fSize * m10) / 10;
double getTabletSize(double size) => (size * m10) / 18;
double m10 = 0.0227;
