import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPressed;
  final MaterialStateProperty<Color> backgroundColor;

  PrimaryButton(this.text, {this.onPressed, this.icon, this.backgroundColor});

  @override
  Widget build(BuildContext ctx) {
    return Container(
        child: ElevatedButton(
      child: Row(
        children: [Icon(icon), Text(text)],
      ),
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor:
              backgroundColor ?? MaterialStateProperty.all<Color>(Colors.blue)),
    ));
  }
}
