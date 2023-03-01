
import 'package:flutter/material.dart';
import 'package:musicapp/Constant/colors.dart';

Widget progressIndicator() {
  return const Center(
    child: CircularProgressIndicator(
      backgroundColor: blue3,
      valueColor: AlwaysStoppedAnimation(Colors.white),
    ),
  );
}