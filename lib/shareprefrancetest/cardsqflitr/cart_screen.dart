import 'package:flutter/material.dart';

import 'CartDbHelper.dart';
import 'Cartmodel.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartDbHelper _cartDbHelper = CartDbHelper();
  List<CartItem> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _loadCartItems();
  }

  // Load the cart items from the database
  _loadCartItems() async {
    List<CartItem> items = await _cartDbHelper.getCartItems();
    setState(() {
      _cartItems = items;
    });
  }

  // Remove item from the cart
  _removeItem(int id) async {
    await _cartDbHelper.deleteCartItem(id);
    _loadCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: ListView.builder(
        itemCount: _cartItems.length,
        itemBuilder: (context, index) {
          final item = _cartItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Price: \$${item.price}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () => _removeItem(item.id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Example: Add a dummy item to the cart
          CartItem newItem = CartItem(
              id: DateTime.now().millisecondsSinceEpoch,
              name: 'Item ${_cartItems.length + 1}',
              price: 20.0);
          _cartDbHelper.insertCartItem(newItem);
          _loadCartItems();
        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
