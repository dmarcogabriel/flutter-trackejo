import 'package:flutter/material.dart';
import 'package:flutter_trackejo/app/access/register/register.page.dart';
import 'package:provider/provider.dart';
import 'register.provider.dart';

abstract class RegisterModule {
  static MaterialPageRoute<String> createNavigation(_) {
    return MaterialPageRoute(
        builder: (ctx) => MultiProvider(
              providers: [
                Provider(
                  create: (ctx) => RegisterProvider(),
                )
              ],
              child: RegisterPage(),
            ));
  }
}
