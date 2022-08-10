import 'package:clean_arqui_base/feature/auth/presentation/pages/auth_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String initPage = '/';

  RouteGenerator._();
  static Route<dynamic> generatRoute(RouteSettings settings) {
    switch (settings.name) {
      case initPage:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      default:
        throw const RouteException("Route no found");
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
