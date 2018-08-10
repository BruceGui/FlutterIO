
import 'package:flutter/material.dart';

import 'TodoDetail.dart';

class Todo {

  final String title;
  final String description;

  Todo(this.title, this.description);

}

class TodoScreen extends StatelessWidget {

  final List<Todo> todos;

  TodoScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text('Todos'),
      ),

      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(todo: todos[index],)
                )
              );
            },
          );
        },
      ),

    );
  }

}