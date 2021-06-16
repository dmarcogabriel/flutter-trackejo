import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeTabTitle extends StatelessWidget {
  final String title;

  HomeTabTitle({@required this.title});

  @override
  Widget build(BuildContext _) {
    return Padding(
      padding: EdgeInsets.only(bottom: 7),
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
