import 'package:clean_arqui_base/feature/config/presentation/config_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConfigPage()));
              },
              icon: const Icon(Icons.key))
        ],
      ),
      body: const Center(
        child: Text(
          'Bienvenido',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
