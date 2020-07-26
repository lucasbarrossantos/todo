// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoService on _TodoService, Store {
  final _$itemsAtom = Atom(name: '_TodoService.items');

  @override
  List<Todo> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<Todo> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$findAllAsyncAction = AsyncAction('_TodoService.findAll');

  @override
  Future<void> findAll() {
    return _$findAllAsyncAction.run(() => super.findAll());
  }

  final _$addAsyncAction = AsyncAction('_TodoService.add');

  @override
  Future<void> add(Todo todo) {
    return _$addAsyncAction.run(() => super.add(todo));
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
