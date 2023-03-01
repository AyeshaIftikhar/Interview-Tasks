import 'package:flutter/material.dart';
import 'package:musicapp/Constant/colors.dart';
import 'package:musicapp/Constant/consts.dart';

ThemeData getDefaultTheme() {
  return ThemeData(
    fontFamily: fontfamily,
    brightness: Brightness.light,
    primaryColor: white,
    // ignore: deprecated_member_use
    accentColor: blue3,
    visualDensity: VisualDensity.comfortable,
    // scaffoldBackgroundColor: white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: white,
      // ignore: deprecated_member_use
      textTheme: TextTheme(button: TextStyle(color: black)),
      iconTheme: IconThemeData(color: black),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: blue,
      foregroundColor: white,
      elevation: 2.0,
    ),
    primaryIconTheme: const IconThemeData(color: black),
    primaryTextTheme: const TextTheme(caption: TextStyle(color: black)),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
  );
}
