import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabowsla_server/core/constants/type_def.dart';

class Styles {
  Styles(this.s);

  final double s;

  TX get white30 => TX(color: Colors.white30, fontSize: s, fontFamily: _fon);
  TX get white24 => TX(color: Colors.white24, fontSize: s, fontFamily: _fon);
  TX get white54 => TX(color: Colors.white54, fontSize: s, fontFamily: _fon);
  TX get white => TX(color: Colors.white, fontSize: s, fontFamily: _fon);
  TX get whiteBold => TX(
        color: Colors.white,
        fontSize: s,
        fontFamily: _fon,
        fontWeight: FontWeight.bold,
      );

  String? get _fon => GoogleFonts.poppins().fontFamily;
}

var styles10 = Styles(10);
var styles12 = Styles(12);
var styles14 = Styles(14);
var styles24 = Styles(24);
var styles26 = Styles(26);
var styles30 = Styles(30);
var styles32 = Styles(32);
var styles36 = Styles(36);

extension StylesExtension on TextStyle {
  TextStyle get applyW900 => copyWith(fontWeight: FontWeight.w900);
  TextStyle get applyW800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get applyW700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get applyW600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get applyW500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get applyW400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get applyBold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get applyItalic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get applyUnderline =>
      copyWith(decoration: TextDecoration.underline);
  TextStyle get applyLineThrough =>
      copyWith(decoration: TextDecoration.lineThrough);
  TextStyle get applyOverline => copyWith(decoration: TextDecoration.overline);
}
