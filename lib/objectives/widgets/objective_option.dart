import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ObjectiveOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onPressed;
  final bool isSelected;

  ObjectiveOption(
      {@required this.icon,
      @required this.text,
      @required this.onPressed,
      this.isSelected});

  @override
  Widget build(BuildContext ctx) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 7),
        child: OutlinedButton(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Icon(
                    icon,
                    color:
                        isSelected ? Colors.white : Theme.of(ctx).primaryColor,
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: isSelected ? Colors.white : Color(0xff9B9B9B)),
                ),
              ],
            ),
            onPressed: onPressed,
            style: _setObjectiveOptionStyle(ctx)));
  }

  ButtonStyle _setObjectiveOptionStyle(BuildContext ctx) {
    MaterialStateProperty<Color> backgroundColor =
        MaterialStateProperty.all<Color>(
            isSelected ? Theme.of(ctx).primaryColor : Color(0xffF6F6F6));
    Color borderColor = isSelected ? Colors.white : Color(0xffE8E8E8);

    return ButtonStyle(
        backgroundColor: backgroundColor,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: borderColor)));
  }
}
