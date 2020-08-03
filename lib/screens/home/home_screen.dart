import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_everis/dominio/model/todo.dart';
import 'package:todo_everis/dominio/service/todo_service.dart';
import 'package:todo_everis/screens/home/components/item_tile.dart';
import 'package:todo_everis/screens/home/components/modal_add_or_edit.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final ModalAddOrEdit modalAddOrEdit = ModalAddOrEdit();

  @override
  Widget build(BuildContext context) {
    final _todoService = Provider.of<TodoService>(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text('Todo'),
          centerTitle: true,
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                modalAddOrEdit.addOrEditItem(context: context, todo: Todo());
              },
              child: Icon(Icons.add, size: 22, color: Colors.white),
            )
          ],
        ),
        body: Observer(
          builder: (_) {
            return ListView.builder(
              padding: const EdgeInsets.all(6),
              itemCount: _todoService.items.length,
              itemBuilder: (_, index) => ItemTile(_todoService.items[index]));
          },
        ));
  }
}
