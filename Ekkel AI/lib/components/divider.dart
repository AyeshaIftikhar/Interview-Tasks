import 'package:flutter/material.dart';
import 'package:task/global/app_globals.dart' as globals;

import '../global/app_globals.dart';
import '../widgets/custom_widget.dart';

class Dividers extends StatelessWidget {
  const Dividers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      title: '6 / $count',
      value: globals.divide().toString(),
    );
  }
}
