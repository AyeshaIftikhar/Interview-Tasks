import 'package:flutter/material.dart';
import 'package:musicapp/Constant/colors.dart';
import 'package:musicapp/Constant/consts.dart';

InputDecoration inputDecoration({
  String? helper,
  String? hint,
  String? error,
  String? label,
  Color? labelColor = grey,
  Color? helperColor = grey,
  Color? errorColor = red,
  Color? hintColor = grey,
  Widget? suffix,
  Widget? prefix,
  bool? filled = false,
  Color? filledColor,
  Color? focusColor = grey,
  InputBorder? border,
  Color? borderColor = grey,
  InputBorder? errorBorder,
  InputBorder? focusBorder,
  bool? dense = true,
  double hintSize = 12,
  double radius =4,
  String fontFamily = fontfamily,
  Widget? icon,
}) {
  return InputDecoration(
    icon: icon,
    isDense: dense,
    filled: filled,
    fillColor: filledColor,
    helperText: helper,
    errorText: error,
    labelText: label,
    hintText: hint,
    helperStyle: TextStyle(color: helperColor, fontFamily: fontFamily),
    errorStyle: TextStyle(color: errorColor, fontFamily: fontFamily),
    labelStyle: TextStyle(color: labelColor, fontFamily: fontFamily),
    hintStyle:
        TextStyle(color: hintColor, fontFamily: fontFamily, fontSize: hintSize),
    suffixIcon: suffix,
    prefixIcon: prefix,
    border: border ??
        OutlineInputBorder(
          borderSide: BorderSide(color: borderColor!),
          borderRadius: BorderRadius.circular(radius),
        ),
    enabledBorder: border ??
        OutlineInputBorder(
          borderSide: BorderSide(color: borderColor!),
          borderRadius: BorderRadius.circular(radius),
        ),
    focusedBorder: focusBorder ??
        OutlineInputBorder(
          borderSide: BorderSide(color: focusColor!),
          borderRadius: BorderRadius.circular(radius),
        ),
    errorBorder: errorBorder ??
        OutlineInputBorder(
          borderSide: BorderSide(color: errorColor!),
          borderRadius: BorderRadius.circular(radius),
        ),
    focusedErrorBorder: errorBorder ??
        OutlineInputBorder(
          borderSide: BorderSide(color: errorColor!),
          borderRadius: BorderRadius.circular(radius),
        ),
    disabledBorder: border ??
        OutlineInputBorder(
          borderSide: BorderSide(color: borderColor!),
          borderRadius: BorderRadius.circular(radius),
        ),
  );
}
