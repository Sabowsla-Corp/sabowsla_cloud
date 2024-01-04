import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Future<Uint8List?> renderWidget(
  GlobalKey globalKey, {
  String pathId = '',
  bool saveToFile = false,
}) async {
  late RenderObject? object = globalKey.currentContext?.findRenderObject();
  if (object != null) {
    if (kDebugMode) {
      //Split this method for debug mode and production mode, will cause a failure if joined due to debugNeedsPaint
      if (!object.debugNeedsPaint) {
        RenderRepaintBoundary boundary = object as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage();
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);

        var bytes = byteData!.buffer.asUint8List();
        return bytes;
      }
    } else {
      RenderRepaintBoundary boundary = object as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);

      var bytes = byteData!.buffer.asUint8List();
      return bytes;
    }
  }
  return null;
}
