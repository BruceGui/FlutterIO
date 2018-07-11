
/// Row Example code
///
///

import 'package:flutter/material.dart';

class RowE extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Row Example'),
      ),

      body: new Row(
        children: <Widget>[
          new Expanded(
              child: new Text('Decemenber', textAlign: TextAlign.center,),
          ),

          new Expanded(
              child: new Text('January', textAlign: TextAlign.center,)
          ),

          new Expanded(
            child: new FittedBox(
              fit: BoxFit.contain,
              child: const FlutterLogo(),
            ),
          )
        ],
      ),
    );
  }

}