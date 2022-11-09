import 'package:flutter/material.dart';
import 'package:task/global/app_globals.dart' as globals;

import '../widgets/custom_widget.dart';

class Subtractor extends StatelessWidget {
  const Subtractor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      title: '4 - ${globals.count}',
      value: globals.subtract().toString(),
    );
  }
}
