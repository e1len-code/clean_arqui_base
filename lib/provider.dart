import 'package:clean_arqui_base/global/theme_data.dart';
import 'package:clean_arqui_base/utils/storage_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightTheme;
  ThemeData getTheme() => _themeData;

  ThemeProvider() {
    StorageManager.readData('themeMode').then((value) {
      final themeData = value ?? 'light';
      themeData == 'light' ? _themeData = lightTheme : _themeData = darkTheme;
      notifyListeners();
    });
    void setLightTheme() async {
      StorageManager.saveData('themeMode', 'light');
      notifyListeners();
    }

    void setDarkTheme() async {
      StorageManager.saveData('themeMode', 'dark');
      notifyListeners();
    }

    void changeMode() async {
      _themeData = _themeData == lightTheme ? darkTheme : lightTheme;
      StorageManager.saveData(
          'themeMode', _themeData == lightTheme ? 'light' : 'dark');
      notifyListeners();
    }
  }
}
