import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/app/access/register/register.module.dart';
import 'app/home/home.navigation.dart';
import 'package:flutter_trackejo/app/access/login.module.dart';

class AppRouter {
  static Route<dynamic> onGenerateRouter(
    RouteSettings settings,
    BuildContext ctx,
  ) {
    switch (settings.name) {
      case '/':
        return HomeNavigation.createNavigation(ctx);
        break;
      case '/login':
        return LoginModule.createNavigation(ctx);
        break;
      case '/register':
        return RegisterModule.createNavigation(ctx);
      default:
        return HomeNavigation.createNavigation(ctx);
    }
  }
}
