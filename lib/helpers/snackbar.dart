import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class TCSnackbar {
  static void showSnackbar({
    @required BuildContext ctx,
    @required String text,
    String label,
    void Function() onPressed,
  }) {
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      content: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color(0xff827E7A),
      action: label != null && label.isNotEmpty
          ? SnackBarAction(
              textColor: Theme.of(ctx).primaryColor,
              label: label,
              onPressed: onPressed,
            )
          : null,
      padding: EdgeInsets.only(top: 4, bottom: 4, left: 14),
    ));
  }
}
