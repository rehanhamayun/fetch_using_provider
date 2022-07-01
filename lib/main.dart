import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_functions/cart_provider.dart';

import 'package:provider_functions/cartlist_provider.dart';
import 'package:provider_functions/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider<CartList>(
          create: (_) => CartList(),
        ),
      ],
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
        );
      }),
    );
  }
}
