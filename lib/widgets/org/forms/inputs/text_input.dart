import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextInput extends StatefulWidget {
  final String value;
  final String label;
  final String hintText;
  final Function onChanged;
  final bool obscureText;
  final Widget suffix;
  final List<String Function(String)> validators;

  TextInput({
    @required this.value,
    @required this.label,
    @required this.onChanged,
    this.hintText,
    this.obscureText = false,
    this.suffix,
    this.validators,
  });

  @override
  _TextInputState createState() => _TextInputState(
        label: label,
        value: value,
        hintText: hintText,
        onChanged: onChanged,
        obscureText: obscureText,
        suffix: suffix,
      );
}

class _TextInputState extends State<TextInput> {
  String value;
  String label;
  String hintText;
  Function onChanged;
  bool obscureText;
  Widget suffix;
  String _errorText;
  final List<String Function(String)> validators;

  _TextInputState({
    this.value,
    this.label,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.suffix,
    this.validators,
  });

  @override
  Widget build(BuildContext ctx) {
    return InputDecorator(
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            errorText: _errorText,
            suffix: suffix ?? null),
        child: TextField(
          decoration: InputDecoration.collapsed(hintText: hintText),
          onChanged: _handleChange,
          obscureText: obscureText,
        ));
  }

  void _validate(String value) {
    print('validators');
    print(validators);
    validators.forEach((validator) {
      String errorText = validator(value);
      if (errorText.isNotEmpty) {
        errorText = _errorText;
      }
    });
  }

  void _handleChange(String value) {
    _validate(value);
    onChanged(value);
  }
}
