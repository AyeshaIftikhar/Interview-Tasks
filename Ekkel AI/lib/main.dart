// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task/components/counter.dart';
import 'package:task/components/divider.dart';
import 'package:task/components/multiplier.dart';
import 'package:task/components/subtracter.dart';

import 'global/app_globals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Task'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Multiplier(),
            Subtractor(),
            Dividers(),
            Counter(
              increment: () {
                setState(() {
                  count += 1;
                });
              },
              decrement: () {
                setState(() {
                  count -= 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
