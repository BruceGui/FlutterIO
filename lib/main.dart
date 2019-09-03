
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Hacking Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Hacking'),
        ),

        body: Center(
          child: Text('Hacking Flutter For FUN'),
        ),
      ),

    );
  }
}