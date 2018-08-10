
import 'package:flutter/material.dart';

import 'Todo.dart';

class DetailScreen extends StatelessWidget {

  final Todo todo;

  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text("${todo.title}"),
      ),

      body: Padding(
        padding: EdgeInsets.all(48.0),
        child: Text("${todo.description}"),
      ),

    );
  }
}