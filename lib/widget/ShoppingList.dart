
import 'package:flutter/material.dart';
import 'ShoppingListItem.dart';

class ShoppingList extends StatefulWidget {

  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  _ShoppingListState createState() => _ShoppingListState();

}

class _ShoppingListState extends State<ShoppingList> {

  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {

    setState(() =>
      inCart ? _shoppingCart.add(product) : _shoppingCart.remove(product));

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shopping List'),
      ),

      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),

    );
  }

}