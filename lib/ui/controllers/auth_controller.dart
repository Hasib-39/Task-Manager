import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/data/models/user_model.dart';

class AuthController {
  static String? accessToken;
  static UserModel? userModel;

  static Future<void> saveUserData(String accessToken, UserModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('access-token', accessToken);
    await sharedPreferences.setString('user-data', jsonEncode(model.toJson()));
  }

  static Future<void> getUserData() async {
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   String? token = sharedPreferences.getString('access-token');
   String? userData = sharedPreferences.getString('user-data');
   accessToken = token;
   userModel = UserModel.fromJson(jsonDecode(userData!));
  }
  static Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('access-token');
    if(token != null){
      await getUserData();
      return true;
    }
    return false;
  }


}