import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo/models/todo.dart';

class AppProvider {
  static const String url = 'https://localhost:3000/api/v1/';

  static Future<Todo> addTask(Todo todo) async {
    final uri = Uri.parse('$url/post');
    Get.log('Uri: $uri');
    final response = await http.post(uri, body: todo.toJson());
    debugPrint('response: $response');
    final body = jsonDecode(response.body);
    debugPrint('body: $body');
    if (body['success']) {
      return Todo.fromJson(body['data']);
    } else {
      throw Exception(body['message']);
    }
  }

  static Future<List<Todo>> getTasks(String userid) async {
    final uri = Uri.parse('$url/userdata/$userid');
    Get.log('Uri: $uri');
    final response = await http.get(uri);
    debugPrint('response: $response');
    final body = jsonDecode(response.body);
    debugPrint('body: $body');
    if (body['success']) {
      return body['data'].map((e) => Todo.fromJson(e)).toList();
    } else {
      throw Exception(body['message']);
    }
  }

  static Future<Todo> updateTask(Todo todo) async {
    final uri = Uri.parse('$url/update/${todo.id}');
    Get.log('Uri: $uri');
    final response = await http.put(uri, body: todo.toJson());
    debugPrint('response: $response');
    final body = jsonDecode(response.body);
    debugPrint('body: $body');
    if (body['success']) {
      return Todo.fromJson(body['data']);
    } else {
      throw Exception(body['message']);
    }
  }

  static Future<bool> deleteTask(String id) async {
    final uri = Uri.parse('$url/delete/$id');
    Get.log('Uri: $uri');
    final response = await http.delete(uri);
    debugPrint('response: $response');
    final body = jsonDecode(response.body);
    debugPrint('body: $body');
    return body['message'];
  }
}
