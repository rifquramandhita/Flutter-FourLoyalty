import 'package:shared_preferences/shared_preferences.dart';

class SharePreference {
  static setInt(String key, int value) async  {
    final pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
  }

  static setString(String key, String value) async  {
    final pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  static setDouble(String key, double value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setDouble(key, value);
  }

  static setBoolean(String key, bool value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool(key, value);
  }

  static getInt(String key) async  {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt(key);
  }

  static getString(String key) async  {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  static getDouble(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getDouble(key);
  }

  static getBoolean(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(key);
  }

  static logout() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }



}
