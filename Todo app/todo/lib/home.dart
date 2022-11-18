import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/widgets/todo_widget.dart';

import 'models/todo.dart';
import 'provider/api_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userid = '';

  getAllTasks() async {
    todos.assignAll(await AppProvider.getTasks(userid));
    setState(() {});
  }

  getUserid() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userid = prefs.getString('userid') ?? Random().nextInt(99999).toString();
      if (prefs.getString('userid') == null) prefs.setString('userid', userid);
      debugPrint('userid: $userid');
      getAllTasks();
    });
  }

  RxList<Todo> todos = <Todo>[].obs;

  Future addData(Todo todo) async {
    todo = await AppProvider.addTask(todo);
    if (todo.id != null) todos.add(todo);
    setState(() {});
    Get.back();
  }

  addTask() {
    final TextEditingController title = TextEditingController();
    final TextEditingController description = TextEditingController();
    final TextEditingController date = TextEditingController();
    final GlobalKey<FormState> form = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (context) {
        return Form(
          key: form,
          child: AlertDialog(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: TextFormField(
              controller: title,
              validator: (val) {
                if (val!.isEmpty) {
                  return '*Required';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    readOnly: true,
                    controller: date,
                    onTap: () async {
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2100),
                      ).then((value) {
                        date.text = DateFormat('dd-MM-yyyy').format(value!);
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Due date',
                      labelText: 'Due date',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                  ).marginOnly(bottom: 5),
                  TextFormField(
                    maxLines: null,
                    controller: description,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText: 'Description...',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                  ).marginOnly(bottom: 15),
                ],
              ),
            ),
            actions: [
              OutlinedButton(
                onPressed: () => Get.back(),
                child: const Text('Cancel'),
              ).marginOnly(right: 15),
              ElevatedButton(
                onPressed: () async {
                  Get.focusScope!.unfocus();
                  form.currentState!.save();
                  if (form.currentState!.validate()) {
                    final Todo todo = Todo(
                      title: title.text,
                      description: description.text,
                      due: date.text,
                      userid: userid,
                    );
                    await addData(todo);
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    getUserid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: todos.isEmpty
          ? const Center(child: Text('Nothing to show..'))
          : ListView.builder(
              itemCount: todos.length,
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 10,
                bottom: 10,
              ),
              itemBuilder: (context, index) {
                final Todo todo = Todo.fromJson(todos[index]);
                return TodoWidget(
                  todo: todo,
                  ontap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: TextFormField(
                            initialValue: todo.title!,
                            style: const TextStyle(fontSize: 18),
                            onChanged: (val) {
                              setState(() {
                                todo.title = val;
                              });
                            },
                          ),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  initialValue: todo.description ?? '',
                                  onChanged: (val) {
                                    setState(() {
                                      todo.description = val;
                                    });
                                  },
                                ).marginOnly(bottom: 10),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    todo.due ?? '',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            IconButton(
                              onPressed: () async {
                                await AppProvider.deleteTask(todo.id!)
                                    .then((value) {
                                  setState(() {
                                    if (value) {
                                      todos.removeWhere(
                                        (element) => element.id == todo.id,
                                      );
                                    }
                                  });
                                  Get.back();
                                });
                              },
                              icon: const Icon(Icons.delete),
                            ),
                            TextButton(
                              onPressed: () async {
                                todos[index] =
                                    await AppProvider.updateTask(todo);
                                Get.back();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
