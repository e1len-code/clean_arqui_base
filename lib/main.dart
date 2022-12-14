import 'package:clean_arqui_base/app.dart';
import 'package:clean_arqui_base/feature/cuenta/presentation/bloc/cuenta_bloc.dart';
import 'package:clean_arqui_base/provider.dart';
import 'package:flutter/material.dart';
import 'package:clean_arqui_base/injections.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:provider/provider.dart';

import 'package:clean_arqui_base/feature/auth/presentation/bloc/auth_bloc.dart';
import 'injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<CuentaBloc>(),
        ),
      ],
      child: ChangeNotifierProvider(
          create: (context) => DarkThemeProvider(),
          child: const CleanArquiBase()),
    );
  }
}
