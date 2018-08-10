import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Countdown Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CountdownWidget();
  }
}

class _CountdownState extends State<CountdownWidget> {

  int val = 3;
  CountDown cd;

  @override
  void initState() {
    super.initState();
    countdown();
  }

  void countdown(){
    print("countdown() called");
    cd = new CountDown(new Duration(seconds: 4));
    StreamSubscription sub = cd.stream.listen(null);
    sub.onDone(() {
      print("Done");
    });
    sub.onData((Duration d) {
      if (val == d.inSeconds) return;
      print("onData: d.inSeconds=${d.inSeconds}");
      setState((){
        val = d.inSeconds;
      });
    });
  }

  @override
  build(BuildContext context){
    return new Scaffold(
      body: new Container(
        child: new Center(
          child: new Text(val.toString(), style: new TextStyle(fontSize: 150.0)),
        ),
      ),
    );
  }
}

class CountdownWidget extends StatefulWidget {

  @override
  _CountdownState createState() => new _CountdownState();
}
