

import 'package:flutter/material.dart';

class SnackBarE extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text('SnackBar'),
      ),

      body: SnackBarPage(),

    );
  }

}

class SnackBarPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: RaisedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Yay! A SnackBar'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {

              },
            ),
          );

          Scaffold.of(context).showSnackBar(snackBar);
        },

        child: Text('Show SnackBar'),
      ),
    );
  }
  
}