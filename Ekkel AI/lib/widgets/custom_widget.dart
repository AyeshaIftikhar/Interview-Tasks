import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Stack(
        children: [
          Container(
            width: width,
            height: height * 0.17,
            decoration: BoxDecoration(border: Border.all()),
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Center(child: Text(title)),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 80,
              height: 40,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(),
              ),
              child: Center(child: Text(value)),
            ),
          ),
        ],
      ),
    );
  }
}
