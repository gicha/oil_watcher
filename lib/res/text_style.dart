import 'package:flutter/material.dart';
import 'package:oil_watcher/res/res.dart';

TextStyle ITTextStyle({
  String fontFamily,
  double fontSize,
  FontWeight fontWeight,
  Color color = ITColors.text,
}) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
