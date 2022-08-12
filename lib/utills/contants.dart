import 'package:flutter/material.dart';

TextStyle kTextStyle({
  Color? color,
  double size = 14,
  FontWeight fontWeight = FontWeight.w500,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
      color: color ?? Colors.white,
      fontSize: size,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height);
}

Color bottomNavigationBarColor = const Color(0xff322B54);
Color? backgroundColor =  const Color(0xff0F0B24);
Color? appBarColor = Colors.indigo[900];

enum ComState { isInit, isBusy, isSuccess, isError }
