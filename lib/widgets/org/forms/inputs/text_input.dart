import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/widgets/org/forms/inputs/input.interface.dart';

class Input implements InputInterface {
  String value;
  String label;
  String hintText;
  Function onChanged;

  Input({this.label, this.hintText, this.onChanged});
}

class TextInput extends StatelessWidget {
  final Input input;

  TextInput({@required this.input});

  @override
  Widget build(BuildContext ctx) {
    return InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
          labelText: input.label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        child: TextField(
          decoration: InputDecoration.collapsed(hintText: input.hintText),
          onChanged: (value) => input.onChanged(value),
        ));
  }
}
