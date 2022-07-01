import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:provider_functions/cart_provider.dart';
import 'package:provider_functions/cart_items_price.dart';
import 'package:provider_functions/cartlist_provider.dart';
import 'package:provider_functions/db_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //BOOLEAN
  //bool _rehan = false;

  DBHelper dbHelper = DBHelper();

  //ARRAYS DATA
  List<String> productName = [
    'Mango',
    'Orange',
    'Grapes',
    'Banana',
    'Chery',
    'Peach',
    'Mixed Fruit Basket',
  ];
  List<String> productUnit = [
    'KG',
    'Dozen',
    'KG',
    'Dozen',
    'KG',
    'KG',
    'KG',
  ];
  List<int> productPrice = [10, 20, 30, 40, 50, 60, 70];
  List<String> productImage = [
    'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg',
    'https://image.shutterstock.com/image-photo/orange-fruit-slices-leaves-isolated-600w-1386912362.jpg',
    'https://image.shutterstock.com/image-photo/green-grape-leaves-isolated-on-600w-533487490.jpg',
    'https://media.istockphoto.com/photos/banana-picture-id1184345169?s=612x612',
    'https://media.istockphoto.com/photos/cherry-trio-with-stem-and-leaf-picture-id157428769?s=612x612',
    'https://media.istockphoto.com/photos/single-whole-peach-fruit-with-leaf-and-slice-isolated-on-white-picture-id1151868959?s=612x612',
    'https://media.istockphoto.com/photos/fruit-background-picture-id529664572?s=612x612',
  ];
  // ENDS

  @override
  Widget build(BuildContext context) {
    // PROVIDER DEPENDENCY INJECTION

    final cart = Provider.of<CartProvider>(context);
    final cartList = Provider.of<CartList>(context);

    //print(cart.selectedProducts());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text(
          "Products ${cart.totalPrice} ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Center(
              child: Badge(
                badgeContent: Text("${cart.counter}"),
                badgeColor: Colors.white,
                borderSide: BorderSide.none,
                animationDuration: Duration(milliseconds: 300),
                child: Icon(CupertinoIcons.shopping_cart),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productName.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.white,
                  elevation: 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(index.toString()),
                      SizedBox(
                        width: 5,
                      ),
                      Image(
                        height: 100,
                        width: 100,
                        image: NetworkImage(
                          productImage[index].toString(),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${productPrice[index]}\$ ".toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        productName[index].toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(6, 6),
                          primary: Colors.black87,
                        ),
                        onPressed: () {
                          cart.addCounter();
                          cartList.addProduct(productName[index]);

                          cart.addTotalPrice(productPrice[index].toDouble());
                        },
                        child: Text("+"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(6, 6),
                          primary: Colors.black87,
                        ),
                        onPressed: () {
                          cartList.removeProduct(productName[index]);
                          cart.removeCounter();
                          cart.removeTotalPrice(productPrice[index].toDouble());
                        },
                        child: Text("-"),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
