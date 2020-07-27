import 'package:todo_everis/dominio/api/api.dart';
import 'package:todo_everis/dominio/model/todo.dart';

class TodoRepository {
  final Api _api = Api();

  Future<List<Todo>> findAll() async {
    return _api.findAll();
  }

  Future<Todo> add(Todo todo) async {
    return await _api.add(todo);
  }

  Future<Todo> update(Todo todo) async {
    return await _api.update(todo);
  }

  Future<dynamic> delete(String todoId) async {
    return await _api.deleteId(todoId);
  }
}
