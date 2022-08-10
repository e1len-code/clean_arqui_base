import 'package:clean_arqui_base/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigPage extends StatefulWidget {
  ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Center(
          child: IconButton(
              onPressed: () {
                setState(() {
                  bool theme = themeProvider.darkTheme;
                  themeProvider.darkTheme = !theme;
                });
              },
              icon: const Icon(Icons.abc_rounded))),
    );
  }
}
