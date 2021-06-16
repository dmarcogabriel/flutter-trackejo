import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeadingBase extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;

  HeadingBase(
      {@required this.title, @required this.fontSize, @required this.color});

  @override
  Widget build(BuildContext ctx) {
    return Text(
      title,
      style: _setHeadingBaseStyle(),
    );
  }

  TextStyle _setHeadingBaseStyle() {
    return TextStyle(
        fontSize: fontSize, fontWeight: FontWeight.bold, color: color);
  }
}

class Heading1 extends StatelessWidget {
  final String title;
  final Color color;
  final double _fontSize = 24;

  Heading1({@required this.title, this.color = Colors.black});

  @override
  Widget build(BuildContext ctx) {
    return HeadingBase(title: title, fontSize: _fontSize, color: color);
  }
}

class Heading2 extends StatelessWidget {
  final String title;
  final Color color;
  final double _fontSize = 16;

  Heading2({@required this.title, this.color = Colors.black});

  @override
  Widget build(BuildContext ctx) {
    return HeadingBase(title: title, fontSize: _fontSize, color: color);
  }
}

class BigText extends StatelessWidget {
  final String title;
  final Color color;
  final double _fontSize = 30;

  BigText({@required this.title, this.color = Colors.black});

  @override
  Widget build(BuildContext ctx) {
    return HeadingBase(title: title, fontSize: _fontSize, color: color);
  }
}
