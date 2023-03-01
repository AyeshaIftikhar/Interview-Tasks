
import 'package:flutter/material.dart';
import 'package:musicapp/Constant/colors.dart';
import 'package:musicapp/Constant/consts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.size = 14,
    this.font = fontfamily,
    this.weight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.fontStyle = FontStyle.normal,
    this.alignment = Alignment.topLeft,
    this.color = black,
    this.overflow,
    this.maxLines,
  }) : super(key: key);
  final String font;
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextAlign textAlign;
  final Alignment alignment;
  final FontStyle fontStyle;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: font,
          fontWeight: weight,
          fontStyle: fontStyle,
        ),
      ),
    );
  }
}
