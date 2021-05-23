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
        margin: EdgeInsets.only(top: 7, bottom: 7),
        child: ElevatedButton(
            child: Row(
              children: _setChildren(),
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            onPressed: onPressed,
            style: _createButtonStyle(backgroundColor)));
  }

  List<Widget> _setChildren() {
    if (icon == null) return [Text(text)];
    return [Icon(icon), Text(text)];
  }

  ButtonStyle _createButtonStyle(MaterialStateProperty<Color> backgroundColor) {
    return ButtonStyle(
      backgroundColor:
          backgroundColor ?? MaterialStateProperty.all<Color>(Colors.blue),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
      ),
    );
  }
}
