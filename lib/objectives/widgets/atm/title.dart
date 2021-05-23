import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTitle extends StatelessWidget {
  final String title;
  final double fontSize = 24;

  AppTitle(this.title);

  @override
  Widget build(BuildContext ctx) {
    return Text(
      title,
      style: _setTitleStyle(),
    );
  }

  TextStyle _setTitleStyle() {
    return TextStyle(
        fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.black);
  }
}
