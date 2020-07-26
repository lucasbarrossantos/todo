import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_everis/repository/todo_repository.dart';
import 'package:todo_everis/model/todo.dart';

part 'todo_service.g.dart';

class TodoService = _TodoService with _$TodoService;

abstract class _TodoService with Store {

  final TodoRepository _todoRepository = TodoRepository();

  _TodoService() {
    findAll();
  }

  @observable
  List<Todo> items = [];

  @action
  Future<void> findAll() async {
    items.clear();
    items = await _todoRepository.findAll();
    debugPrint('Items Qtd: ${items.length}');
  }

  @action
  add(Todo todo) async {
    todo.createdAt = DateTime.now().toIso8601String();
    todo = await _todoRepository.add(todo);
    items.add(todo);
    print(items.length);
  }

}
