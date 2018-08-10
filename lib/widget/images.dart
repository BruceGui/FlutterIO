

import 'package:flutter/material.dart';

class ImageE extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(

      appBar: new AppBar(
        title: new Text('Image Example'),
      ),

      // https://docs.flutter.io/flutter/widgets/Row-class.html
      body: new Row(
        children: <Widget>[
          new Expanded(
              child: new Image.network('http://c.hiphotos.baidu.com/image/pic/item/d439b6003af33a87436092e0ca5c10385343b53f.jpg'),
          )
      ],
      ),

    );
  }

}