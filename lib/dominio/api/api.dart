import 'package:dio/dio.dart';
import 'package:todo_everis/dominio/model/todo.dart';

class Api {
  final String _url = "https://5ec6e8bf5961a20016a9eba4.mockapi.io/api/v1/";
  final Dio dio = Dio();
  Response _response = Response();

  Future<List<Todo>> findAll() async {
    _response = await dio.get('$_url/task');
    return (_response.data as List).map((todo) => Todo.fromJson(todo)).toList();
  }

  Future<Todo> add(Todo todo) async {
    _response = await dio.post('$_url/task', data: todo.toJson());
    return Todo.fromJson(_response.data);
  }

  Future<Todo> update(Todo todo) async {
    _response = await dio.put('$_url/task/${todo.id}', data: todo.toJson());
    return Todo.fromJson(_response.data);
  }

  Future<dynamic> deleteId(String todoId) async {
    _response = await dio.delete('$_url/task/$todoId');
    return _response.data;
  }
}
