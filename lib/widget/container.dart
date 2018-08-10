/// Learning Container wdiget
///


import 'package:flutter/material.dart';


class ContainerEx extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Container Exam'),
      ),

      body: new Center(
        /*
        child: new Container(
          margin: const EdgeInsets.all(10.0),
          color:  Colors.greenAccent,
          width: 48.0,
          height: 48.0,
        ),
        */
        child: new Container(
          constraints: new BoxConstraints.expand(
            height: Theme.of(context).textTheme.display1.fontSize*1.1 + 200.0,
          ),

          padding: const EdgeInsets.all(8.0),
          color: Colors.teal.shade700,
          alignment: Alignment.center,
          child: new Text(
            'Hello World',
            style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white),
          ),
          
          foregroundDecoration: new BoxDecoration(
            image: new DecorationImage(
                image: new NetworkImage('http://c.hiphotos.baidu.com/image/pic/item/d439b6003af33a87436092e0ca5c10385343b53f.jpg'),
                centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0)
            ),
          ),

          transform: new Matrix4.rotationZ(0.3),
        ),
      ),
    );
  }

}