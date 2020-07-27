import 'package:mobx/mobx.dart';
import 'package:todo_everis/dominio/model/todo.dart';
import 'package:todo_everis/dominio/repository/todo_repository.dart';

part 'todo_service.g.dart';

class TodoService = _TodoService with _$TodoService;

abstract class _TodoService with Store {

  final TodoRepository _todoRepository = TodoRepository();

  @observable
  bool isEditing = false;

  _TodoService() {
    findAll();
  }

  @observable
  List<Todo> items = [];

  @action
  Future<void> findAll() async {
    items.clear();
    items = await _todoRepository.findAll();
  }

  @action
  Future<void> add(Todo todo) async {
    todo.createdAt = DateTime.now().toIso8601String();
    todo = await _todoRepository.add(todo);
    items = List.from(items..add(todo));
    setEditing();
  }

  @action
  void setEditing() => isEditing = !isEditing;

}
