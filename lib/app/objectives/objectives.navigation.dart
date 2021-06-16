import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/app/objectives/objectives_page.dart';

abstract class ObjectivesNavigation {
  static MaterialPageRoute<ObjectivesPage> createNavigation(BuildContext ctx) =>
      MaterialPageRoute(builder: (ctx) => ObjectivesPage());
}
