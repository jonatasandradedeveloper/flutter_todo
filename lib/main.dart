import 'package:flutter/material.dart';
import 'package:todo/todo_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const TodoListPage(),
    );
  }
}
