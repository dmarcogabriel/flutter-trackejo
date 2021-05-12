import 'package:flutter/widgets.dart';

class Option {
  String key;
  String label;
  IconData icon;
  bool isSelected;

  Option(this.key, this.label, this.icon, {this.isSelected = false});
}
