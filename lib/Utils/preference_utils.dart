

import 'package:agora/Ui/auth/login/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils{

  static void setAccessToken(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', accessToken);
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }


  static void setLoginName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
  }
  static Future<String?> getLoginName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }

  static void setLoginEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('email',email );
  }
  static Future<String?> getLoginEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  static void setLoginProfile(String profile) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('profile', profile);
  }
  static Future<String?> getLoginProfile() async {
    final prefs = await SharedPreferences.getInstance();
   return prefs.getString('profile');
  }

  static void setLoginUserName(String username) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
  }
  static Future<String?> getLoginUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }
  static void setLoginUserId(String username) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userid', username);
  }
  static Future<String?> getLoginUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userid');
  }



}