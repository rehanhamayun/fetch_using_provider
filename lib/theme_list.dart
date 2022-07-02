import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_functions/theme_mode.dart';

class ThemeList extends StatefulWidget {
  const ThemeList({Key? key}) : super(key: key);

  @override
  State<ThemeList> createState() => _ThemeListState();
}

class _ThemeListState extends State<ThemeList> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadioListTile<ThemeMode>(
              title: Text("Light Theme"),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          //
          RadioListTile<ThemeMode>(
              title: Text("Dark Theme"),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          //
          RadioListTile<ThemeMode>(
              title: Text("Default Theme"),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
        ],
      ),
    );
  }
}
