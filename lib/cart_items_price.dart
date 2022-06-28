import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_functions/cart_provider.dart';
import 'package:provider_functions/db_helper.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text(
          "Products ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Center(
            child: Badge(
              badgeContent: Text("${cart.counter}"),
              badgeColor: Colors.white,
              borderSide: BorderSide.none,
              animationDuration: Duration(milliseconds: 300),
              child: Icon(CupertinoIcons.shopping_cart),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Total Price: ${cart.totalPrice.toString()} "),
            Text('Selected Products: ${cart.counter}'),
          ],
        ),
      ),
    );
  }
}
