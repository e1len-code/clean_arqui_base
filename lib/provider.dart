import 'package:clean_arqui_base/core/utils/storage_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    StorageManager.saveData(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    final bool? srt = await StorageManager.readData(THEME_STATUS);
    return srt ?? false;
  }
}

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(_darkTheme);
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..progressColor = _darkTheme ? Colors.white : Colors.black
      ..textColor = Colors.white
      ..backgroundColor = Colors.transparent
      ..indicatorColor = _darkTheme ? Colors.black : Colors.white;

    notifyListeners();
  }
}
