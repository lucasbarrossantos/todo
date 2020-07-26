import 'package:flutter/material.dart';
import 'package:todo_everis/model/todo.dart';

class ItemTile extends StatelessWidget {
  final Todo todo;

  const ItemTile(this.todo);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.5,
      child: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              todo.title,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              todo.description,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              todo.createdAt,
              style: TextStyle(fontWeight: FontWeight.w200, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
