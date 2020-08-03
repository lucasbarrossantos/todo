import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:todo_everis/dominio/model/todo.dart';
import 'package:todo_everis/screens/home/components/modal_add_or_edit.dart';

class ItemTile extends StatelessWidget {
  final Todo todo;
  final ModalAddOrEdit modal = ModalAddOrEdit();

  ItemTile(this.todo);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        modal.addOrEditItem(context: context, todo: todo);
      },
      onLongPress: () {
        modal.removeItem(context: context, todo: todo);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        color: RandomColor()
            .randomColor(
            colorHue: ColorHue.multiple(
                colorHues: [ColorHue.blue, ColorHue.red, ColorHue.green]))
            .withAlpha(190),
        elevation: 3.5,
        child: Container(
          margin: const EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.zero,
              topRight: Radius.circular(12),
              bottomLeft: Radius.zero,
              bottomRight: Radius.circular(12),
            ),
          ),
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
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
