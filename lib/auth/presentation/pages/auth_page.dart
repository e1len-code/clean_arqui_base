import 'package:clean_arqui_base/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(),
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
