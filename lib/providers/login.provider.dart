import 'dart:convert';

import 'package:flutter_trackejo/providers/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider {
  Future<User> login(String email, String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String jsonUser = preferences.getString(email);
    if (jsonUser == null)
      return null;
    else {
      dynamic user = jsonDecode(jsonUser);
      if (password == user['password']) {
        await _storeLoggedUser(email);
        return User(email: email, name: user['name']);
      }
      return null;
    }
  }

  Future<void> _storeLoggedUser(String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('@logged_user');
    await preferences.setString('@logged_user', email);
    await preferences.setString("@$email:name", "Victoria Robertson");
  }

  Future<void> logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('@logged_user');
  }
}
