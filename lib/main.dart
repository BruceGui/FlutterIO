
import 'package:flutter/material.dart';

import 'package:flutter_component/component/startup_namer.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green,
        accentColor: Colors.cyan[900],
        fontFamily: 'ChelaOne',
      ),
      home: RandomWords(),

    );
  }
}