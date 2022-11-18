import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/todo.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({Key? key, required this.todo, this.ontap})
      : super(key: key);
  final Todo todo;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap ?? () {},
      child: Card(
        elevation: 7.0,
        margin: const EdgeInsets.only(bottom: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              todo.title!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            if (todo.description != '')
              Text(todo.description ?? '').marginOnly(top: 10, bottom: 10),
            if (todo.due != '')
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Due: ${todo.due}',
                  style: const TextStyle(
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
          ],
        ).marginOnly(left: 15, right: 15, top: 10, bottom: 10),
      ),
    );
  }
}
