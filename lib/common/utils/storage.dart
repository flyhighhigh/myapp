import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// 本地儲存物件 (單一實例)
class StorageUtil {
  static final StorageUtil _instance = StorageUtil._();
  factory StorageUtil() => _instance;
  static SharedPreferences? _prefs;

  /// 物件建構子 (只會被使用一次)
  StorageUtil._();

  static Future<void> init() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  /// set json from key
  Future<bool> setJSON(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal); // convert to json
    return _prefs!.setString(key, jsonString);
  }

  /// get json from key
  dynamic getJSON(String key) {
    String? jsonString = _prefs?.getString(key); // get string from json
    return jsonString == null ? null : jsonDecode(jsonString);
  }
  
  Future<bool> setBool(String key, bool val) {
    return _prefs!.setBool(key, val);
  }

  bool getBool(String key) {
    bool? val = _prefs!.getBool(key);
    return val ?? false; // if not null return val, else return false
  }

  Future<bool> remove(String key) {
    return _prefs!.remove(key);
  }
}