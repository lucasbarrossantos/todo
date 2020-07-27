import 'package:dio/dio.dart';
import 'package:todo_everis/dominio/model/todo.dart';

class Api {
  final String _url = "https://5ec6e8bf5961a20016a9eba4.mockapi.io/api/v1/";
  final Dio dio = Dio();

  Future<List<Todo>> findAll() async {
    Response response = await dio.get('$_url/task');
    return (response.data as List).map((todo) => Todo.fromJson(todo)).toList();
  }

  Future<Todo> add(Todo todo) async {
    Response response = await dio.post('$_url/task', data: todo.toJson());
    return Todo.fromJson(response.data);
  }

  Future<Todo> update(Todo todo) async {
    Response response = await dio.put('$_url/task/${todo.id}', data: todo.toJson());
    return Todo.fromJson(response.data);
  }
}
