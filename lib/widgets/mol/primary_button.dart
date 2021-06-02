import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color backgroundColor;
  final bool isDisabled;

  PrimaryButton(
      {@required this.text,
      @required this.onPressed,
      this.backgroundColor,
      this.isDisabled = false});

  @override
  Widget build(BuildContext ctx) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 7),
        child: ElevatedButton(
            child: Row(
              children: [Text(text)],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            onPressed: isDisabled ? null : onPressed,
            style: _setButtonStyle(ctx)));
  }

  ButtonStyle _setButtonStyle(BuildContext ctx) {
    return ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Theme.of(ctx).primaryColor),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(vertical: 14, horizontal: 35),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))));
  }
}
