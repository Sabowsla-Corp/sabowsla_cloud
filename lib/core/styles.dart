import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/constants/type_def.dart';

class Styles {
  Styles(this.size);

  final double size;

  TX get white30 => TextStyle(color: Colors.white30, fontSize: size);
  TX get white24 => TextStyle(color: Colors.white24, fontSize: size);
  TX get white54 => TextStyle(color: Colors.white54, fontSize: size);
}

var styles10 = Styles(10);
var styles12 = Styles(12);
var styles14 = Styles(14);
