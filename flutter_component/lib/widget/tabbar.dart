
import 'package:flutter/material.dart';

class TabBarE extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(

      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.directions_bike),),
              Tab(icon: Icon(Icons.directions_car),),
              Tab(icon: Icon(Icons.directions_transit),),
            ],
          ),
          title: Text('Tabs DEmo'),
        ),

        body: TabBarView(
          children: <Widget>[
            Icon(Icons.directions_bike),
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
          ],
        ),
      ),

    );
  }

}