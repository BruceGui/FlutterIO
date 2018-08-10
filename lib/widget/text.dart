
import 'package:flutter/material.dart';

class TextE extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(

      appBar: new AppBar(
        title: new Text(
          'Text ee',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: new TextStyle(fontWeight: FontWeight.bold),
        ),

        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.playlist_play),
            tooltip: 'Air it',
            onPressed: null,
          ),
        ],
        
        //bottom: new TabBar(tabs: null),

      ),

      body: new Center(

        child: new Icon(
          Icons.accessible,
          color: Colors.blue,
        ),
      ),

      drawer: new ListTile(
        leading: new Icon(Icons.change_history),
        title: new Text('Change history'),
        onTap: () {
          Navigator.pop(context);
        },
      ),

      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.lightBlue),
        child: FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.add),
        ),
      ),

    );
  }

}