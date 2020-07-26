import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_everis/model/todo.dart';
import 'package:todo_everis/screens/home/components/item_tile.dart';
import 'package:todo_everis/screens/home/components/modal_add_or_edit.dart';
import 'package:todo_everis/service/todo_service.dart';

class HomeScreen extends StatelessWidget {
  //final ModalAddOrEdit modalAddOrEdit = ModalAddOrEdit();
  final _todoService = TodoService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Todo _todo = Todo();
  Todo todo = Todo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo'),
          centerTitle: true,
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Nova tarefa'),
                      content: SingleChildScrollView(
                        child: Form(
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
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Cancelar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          textColor: Colors.grey[700],
                        ),
                        FlatButton(
                          child: Text('Salvar'),
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              _todoService.add(_todo).then((_)=>Navigator.of(context).pop());
                            }
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.add, size: 22, color: Colors.white),
            )
          ],
        ),
        body: Observer(
          builder: (_) {
            //List<Todo> items = ;
            debugPrint('chamou o consumer!!');
            return ListView.builder(
              itemCount: _todoService.items.length,
              itemBuilder: (_, index) => ItemTile(_todoService.items[index]));
          },
        ));
  }
}
