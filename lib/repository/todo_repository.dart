import 'package:todo_everis/api/api.dart';
import 'package:todo_everis/model/todo.dart';

class TodoRepository {
  final Api _api = Api();

  Future<List<Todo>> findAll() async {
    return _api.findAll();
  }

  Future<Todo> add(Todo todo) async {
    return await _api.add(todo);
  }
}
