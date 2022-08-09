import 'dart:async';
import 'package:clean_arqui_base/global/theme_data.dart';
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
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  final _navigatorKey = GlobalKey<NavigatorState>();
  late Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeTimer();
    getCurrentAppTheme();
  }

  void _initializeTimer() {
    _timer = Timer.periodic(const Duration(minutes: 30), (_) {});
  }

  void _handleUserInteraction([_]) {
    _timer.cancel();
    _initializeTimer();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) {
      return themeChangeProvider;
    }, child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _handleUserInteraction,
        onPanDown: _handleUserInteraction,
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          debugShowCheckedModeBanner: false,
          locale: const Locale('es'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en', ''), Locale('es', '')],
          theme: Styles.themeData(themeChangeProvider.darkTheme, context),
          onGenerateRoute: RouteGenerator.generatRoute,
        ),
      );
    }));
  }
}
