
import 'package:flutter/material.dart';

import 'widget/ShoppingListItem.dart';
import 'widget/ShoppingList.dart';

import 'widget/container.dart';
import 'widget/rowcolumn.dart';
import 'widget/images.dart';
import 'widget/text.dart';
import 'widget/snackbars.dart';
import 'widget/tabbar.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Shopping App',
      /*
        home: new ShoppingList(
        products: <Product> [
          new Product(name: 'Eggs'),
          new Product(name: 'Flour'),
          new Product(name: 'Chocolate chips'),
          new Product(name: 'Some Salad')
        ],
      ),
      */
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green,
        accentColor: Colors.cyan[900],
        fontFamily: 'ChelaOne',
      ),
      home: new TabBarE(),

    );
  }
}