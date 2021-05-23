import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/widgets/button.dart';

class ConfirmButton extends StatelessWidget {
  final String text;
  final bool isDisabled;
  final Function onPressed;

  ConfirmButton({this.text = '', this.isDisabled = false, this.onPressed});

  @override
  Widget build(BuildContext ctx) {
    return Container(
      child: Row(
        children: [
          PrimaryButton(text, onPressed: isDisabled ? null : onPressed)
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      margin: EdgeInsets.only(top: 7),
    );
  }
}
