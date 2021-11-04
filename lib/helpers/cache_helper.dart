import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// GET User Data
  static Future<String?> getData({required String key}) async {
    return sharedPreferences!.getString(key);
  }

  /// SET User Data
  static Future<bool?> setData({
    required String key,
    required dynamic value,
  }) async {
    return await sharedPreferences!.setString(key, value);
  }

  /// REMOVE User Data
  static Future<bool?> removeData({
    required String key,
  }) async {
    return await sharedPreferences!.remove(key);
  }
}
