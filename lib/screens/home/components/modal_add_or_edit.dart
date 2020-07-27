import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_everis/dominio/model/todo.dart';
import 'package:todo_everis/dominio/service/todo_service.dart';

class ModalAddOrEdit {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Todo _todo = Todo();

  void addOrEditItem({BuildContext context, Todo todo}) {
    final _todoService = Provider.of<TodoService>(context, listen: false);

    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        print(_todoService.isEditing);
        return AlertDialog(
          title: Text('Nova tarefa'),
          content: SingleChildScrollView(
            child: Observer(
              builder: (_) => Form(
                key: formKey,
                child: ListBody(
                  children: <Widget>[
                    TextFormField(
                      validator: (name) {
                        if (name.length < 5) {
                          return 'Título muito curto';
                        }
                        return null;
                      },
                      initialValue: todo.title,
                      decoration: const InputDecoration(
                        hintText: 'Título da tarefa',
                      ),
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      onSaved: (title) {
                        _todo.title = title;
                      },
                      enabled: !_todoService.isEditing,
                    ),
                    TextFormField(
                      maxLines: 4,
                      validator: (name) {
                        if (name.length < 6) {
                          return 'Descrição muito curta';
                        }
                        return null;
                      },
                      initialValue: todo.description,
                      decoration: const InputDecoration(
                        hintText: 'Descrição da tarefa',
                      ),
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      onSaved: (description) {
                        _todo.description = description;
                      },
                      enabled: !_todoService.isEditing,
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
              textColor: Colors.grey[700],
            ),
            Observer(
              builder: (_) => RaisedButton(
                child: Text('Salvar'),
                onPressed: !_todoService.isEditing
                    ? () async {
                        if (formKey.currentState.validate()) {
                          _todoService.setEditing();
                          formKey.currentState.save();
                          await Future.delayed(Duration(seconds: 3));
                          _todoService
                              .add(_todo)
                              .then((_) => Navigator.of(context).pop());
                        }
                      }
                    : null,
                color: Colors.green[400],
                disabledColor: Colors.green.withAlpha(140),
              ),
            )
          ],
        );
      },
    );
  }
}
