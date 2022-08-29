import 'package:clean_arqui_base/core/widgets/snackbar_widget.dart';
import 'package:clean_arqui_base/feature/auth/domain/entities/loginParams.dart';
import 'package:clean_arqui_base/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_arqui_base/feature/config/presentation/config_page.dart';
import 'package:clean_arqui_base/feature/cuenta/presentation/pages/cuenta_page.dart';
import 'package:clean_arqui_base/feature/webview/presentation/webview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late final AuthBloc _authBloc;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  _login() {
    _authBloc.add(LoginEvent(
        loginParams: LoginParams(
            codUsuario: _emailController.text,
            password: _passwordController.text,
            token: '')));
  }

  _webView() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WebviewPage()));
  }

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
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoadingState) {}
            if (state is LoggedState) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CuentaPage()));
            }
            if (state is ErrorState) {
              SnackWidget.showMessage(context, 'Upssss!!',
                  'Tenemos un problema al iniciar sesion. ${state.message}');
            }
          },
          child: Center(
            child: Column(
              children: [
                const Text('Email'),
                TextFormField(
                  controller: _emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Password'),
                TextFormField(
                  controller: _passwordController,
                ),
                TextButton(
                  onPressed: _login,
                  child: const Text('Iniciar Sesion'),
                ),
                TextButton(
                  onPressed: _webView,
                  child: const Text('Go to WebView'),
                ),
              ],
            ),
          ),
        ));
  }
}
