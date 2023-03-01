import 'package:flutter/material.dart';
import 'package:musicapp/Widgets/custom_text.dart';

Widget titleWidget({required String text}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0, bottom: 10),
    child: CustomText(
      text: text,
      weight: FontWeight.bold,
      size: 16,
    ),
  );
}