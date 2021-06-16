import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class RegisterProvider {
  Future<bool> register(String name, String email, String password) async {
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      await _createUser(email, password, name);
      return true;
    }
    return false;
  }

  Future<void> _createUser(String email, String password, String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print('new user ${jsonEncode({
      'email': email,
      'name': name,
      'password': password
    })}');
    await preferences.setString(email,
        jsonEncode({'email': email, 'name': name, 'password': password}));
  }
}
