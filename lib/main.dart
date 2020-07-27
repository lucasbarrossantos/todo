import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_everis/dominio/service/todo_service.dart';
import 'package:todo_everis/screens/home/home_screen.dart';

void main() {
  runApp(TodoMain());
}

class TodoMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TodoService>(
          create: (_) => TodoService(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TodoList',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
