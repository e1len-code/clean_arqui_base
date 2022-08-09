import 'dart:async';
import 'package:provider/provider.dart';
import 'package:clean_arqui_base/provider.dart';
import 'package:clean_arqui_base/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CleanArquiBase extends StatefulWidget {
  const CleanArquiBase({Key? key}) : super(key: key);

  @override
  State<CleanArquiBase> createState() => _CleanArquiBaseState();
}

class _CleanArquiBaseState extends State<CleanArquiBase> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeTimer();
  }

  void _initializeTimer() {
    _timer = Timer.periodic(const Duration(minutes: 30), (_) {});
  }

  void _handleUserInteraction([_]) {
    _timer.cancel();
    _initializeTimer();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _handleUserInteraction,
      onPanDown: _handleUserInteraction,
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        locale: const Locale('es'),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('en', ''), Locale('es', '')],
        theme: context.watch<ThemeProvider>().getTheme(),
        onGenerateRoute: RouteGenerator.generatRoute,
      ),
    );
  }
}
