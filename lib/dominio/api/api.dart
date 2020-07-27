import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_everis/dominio/model/todo.dart';

class Api {
  final String _url = "https://5ec6e8bf5961a20016a9eba4.mockapi.io/dominio.api/v1";
  final Dio dio = Dio();

  Future<List<Todo>> findAll() async {
    Response response = await dio.get('$_url/task');
    debugPrint('findAll ${response.data}');
    return (response.data as List).map((todo) => Todo.fromJson(todo)).toList();
  }

  Future<Todo> add(Todo todo) async {
    Response response = await dio.post('$_url/task', data: todo.toJson());
    debugPrint('add -> ${response.data}');
    return Todo.fromJson(response.data);
  }
}
