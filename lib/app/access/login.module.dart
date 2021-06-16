import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/app/access/login.page.dart';

abstract class LoginModule {
  static MaterialPageRoute<String> createNavigation(BuildContext ctx) {
    return MaterialPageRoute(
      builder: (ctx) => LoginPage(),
    );
  }
}
