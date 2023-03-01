
import 'package:flutter/material.dart';
import 'package:musicapp/Constant/colors.dart';

AppBar customAppBar({
  Widget? title,
  List<Widget>? actions,
  Widget? leading,
  bool implyleading = false,
  bool centertitle = false,
  double? leadingwidth,
  PreferredSizeWidget? bottom,
  double elevation = 0,
  Color backgroundColor = white,
  Widget? flexibleSpace,
  double? toolbarHeight,
}) {
  return AppBar(
    title: title,
    bottom: bottom,
    actions: actions,
    leading: leading,
    elevation: elevation,
    centerTitle: centertitle,
    leadingWidth: leadingwidth,
    toolbarHeight: toolbarHeight,
    flexibleSpace: flexibleSpace,
    backgroundColor: backgroundColor,
    automaticallyImplyLeading: implyleading,
  );
}
