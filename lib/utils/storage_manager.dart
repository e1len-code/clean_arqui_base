import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static Future<bool> saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
      return true;
    } else if (value is String) {
      prefs.setString(key, value);
      return true;
    } else if (value is bool) {
      prefs.setBool(key, value);
      return true;
    } else if (value is double) {
      prefs.setDouble(key, value);
      return true;
    } else {
      print('Invalid Type');
      return false;
    }
  }

  static Future<dynamic> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key);
    return obj;
  }

  static Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
