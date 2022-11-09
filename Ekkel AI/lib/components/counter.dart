import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:task/global/app_globals.dart' as globals;
import 'package:flutter/cupertino.dart';
import 'package:task/main.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key, required this.increment, required this.decrement}) : super(key: key);
  final VoidCallback increment;
  final VoidCallback decrement;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  updateData() {
    // setState(() {
    globals.count += 1;
    // globals.multiply();
    // });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height * 0.17,
      decoration: BoxDecoration(border: Border.all()),
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: widget.increment , //() => updateData(),
            child: Container(
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(),
              ),
              child: const Center(child: Text('+')),
            ),
          ),
          Center(child: Text(globals.count.toString())),
          InkWell(
            onTap: widget.decrement,
            // onTap: () {
            //   setState(() {
            //     globals.count -= 1;
            //   });
            // },
            child: Container(
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(),
              ),
              child: const Center(child: Text('--')),
            ),
          ),
        ],
      ),
    );
  }
}
