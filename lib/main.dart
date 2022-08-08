import 'package:flutter/material.dart';
import 'package:clean_arqui_base/injections.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:provider/provider.dart';

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
        /* BlocProvider(
          create: (context) => sl<>,
        ),
        BlocProvider(
          create: (context) => SubjectBloc(),
        ), */
      ],
      child: ChangeNotifierProvider(
          create: (context) => ThemeProvider(), child: CleanArquiBase()),
    );
  }
}
