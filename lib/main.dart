import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_functions/cart_provider.dart';

import 'package:provider_functions/cartlist_provider.dart';
import 'package:provider_functions/home_page.dart';
import 'package:provider_functions/theme_list.dart';
import 'package:provider_functions/theme_mode.dart';

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
        ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
        ChangeNotifierProvider<CartList>(create: (_) => CartList()),
        ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger()),
      ],
      child: Builder(builder: (BuildContext context) {
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
              primarySwatch: Colors.blue, brightness: Brightness.light),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          home: ThemeList(),
        );
      }),
    );
  }
}
