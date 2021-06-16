import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home.page.dart';

abstract class HomeNavigation {
  static MaterialPageRoute<HomePage> createNavigation(BuildContext ctx) {
    return MaterialPageRoute(builder: (_) => HomePage());
  }
}
