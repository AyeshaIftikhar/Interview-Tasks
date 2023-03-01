import 'package:flutter/material.dart';
import 'package:musicapp/Constant/colors.dart';

textButton() {
  return TextButton.styleFrom();
}

outlineButton({
  Color? primary = blue,
  Color? surface = white,
  Color? borderColor =blue,
  double? radius = 10.0,
}) {
  return OutlinedButton.styleFrom(
    primary: primary,
    onSurface: surface,
    side: BorderSide(
      color: borderColor!,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)),
  );
}

elevatedButton({
  Color? primary = black,
  Color? surface = white,
  Color? borderColor = black,
  Color onPrimary = white,
  double? radius = 10.0,
}) {
  return ElevatedButton.styleFrom(
    primary: primary,
    onSurface: surface,
    onPrimary: onPrimary,
    side: BorderSide(color: borderColor!),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)),
  );
}
