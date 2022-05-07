import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _rehan = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text(
          "Products",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Center(
            child: Badge(
              badgeContent: _rehan == true ? Text("10") : Text("0"),
              badgeColor: Colors.white,
              borderSide: BorderSide.none,
              animationDuration: Duration(milliseconds: 300),
              child: Icon(CupertinoIcons.shopping_cart),
            ),
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
      body: Container(
        child: ElevatedButton.icon(
            onPressed: () {
              setState(() {
                _rehan = true;
              });
            },
            icon: Icon(Icons.abc),
            label: Text("Rehan")),
      ),
    );
  }
}
