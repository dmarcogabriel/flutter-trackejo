import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/widgets/org/forms/inputs/input.interface.dart';

class DropDown implements InputInterface {
  String value;
  String label;
  String hintText;
  Function onChanged;
  List<String> items;

  DropDown(
      {@required this.label,
      @required this.onChanged,
      @required this.items,
      this.hintText});
}

class DropdownInput extends StatelessWidget {
  final DropDown input;

  DropdownInput({@required this.input});

  @override
  Widget build(BuildContext ctx) {
    return InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
          labelText: input.label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Theme.of(ctx).primaryColor,
          ),
          isDense: true,
          onChanged: (value) => input.onChanged(value),
          items: input.items
              .map((item) => DropdownMenuItem(
                    child: Text(item),
                    value: item,
                  ))
              .toList(),
          // items: []
        )));
  }
}
