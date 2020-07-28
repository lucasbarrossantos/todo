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
  ObservableList<Todo> items = ObservableList<Todo>();

  @action
  Future<void> findAll() async {
    items.clear();
    items = await _todoRepository.findAll();
    sortList();
  }

  @action
  Future<void> addOrUpdate(Todo todo) async {
    if (todo.id == null) {
      await _add(todo);
    } else {
      _update(todo);
    }
  }

  Future _add(Todo todo) async {
    todo.createdAt = DateTime.now().toIso8601String();
    todo = await _todoRepository.add(todo);
    //items = List.from(items..add(todo));
    items.add(todo);
    sortList();
    setEditing();
  }

  @action
  Future<void> _update(Todo todo) async {
    todo.createdAt = DateTime.now().toIso8601String();
    todo = await _todoRepository.update(todo);
    items.removeWhere((item) => item.id == todo.id);
    items = List.from(items..add(todo));
    sortList();
    setEditing();
  }

  @action
  Future<void> delete(String todoId) async {
    print('item deleted!!');
    var response = await _todoRepository.delete(todoId);
    items.removeWhere((item) => item.id == todoId);
    //items = List.from(items);
    sortList();
    setEditing();
  }

  @action
  void setEditing() => isEditing = !isEditing;

  void sortList() {
    items.sort((a, b) => a.id.compareTo(b.id));
  }
}
