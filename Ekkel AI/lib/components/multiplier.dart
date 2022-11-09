import 'package:flutter/material.dart';
import 'package:task/global/app_globals.dart' as globals;

import '../widgets/custom_widget.dart';

class Multiplier extends StatelessWidget {
  const Multiplier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      title: '-5 * ${globals.count}',
      value: (-5 * globals.count).toString(),
    );
  }
}
