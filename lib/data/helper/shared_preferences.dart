import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static String loginKey = "LOGIN";
 
  static Future<bool> saveLogin(bool isUserLoggedIn) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setBool(loginKey, isUserLoggedIn);
  }

  static Future<bool?> getLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.getBool(loginKey);
  }
}