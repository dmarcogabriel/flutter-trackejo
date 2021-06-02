import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/widgets/org/forms/inputs/combobox_list/combobox_list.page.dart';
import 'package:flutter_trackejo/widgets/org/forms/inputs/input.interface.dart';

class Combobox implements InputInterface {
  String label;
  String hintText;
  List<String> items;

  Combobox({@required this.label, @required this.items, this.hintText});
}

class ComboboxInput extends StatefulWidget {
  final Combobox input;
  final Widget action;
  final String value;
  final void Function(String) onChanged;

  ComboboxInput(
      {@required this.input,
      @required this.value,
      @required this.onChanged,
      this.action});

  @override
  _ComboboxInputState createState() => _ComboboxInputState(
      input: input, value: value, onChanged: onChanged, action: action);
}

class _ComboboxInputState extends State<ComboboxInput> {
  final Combobox input;
  final Widget action;
  String value;
  void Function(String) onChanged;

  _ComboboxInputState(
      {@required this.input,
      @required this.value,
      @required this.onChanged,
      this.action});

  @override
  Widget build(BuildContext ctx) {
    return InputDecorator(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
        labelText: input.label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      child: ListTile(
        onTap: () => _handleComboboxTap(ctx),
        trailing: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: Theme.of(ctx).primaryColor,
        ),
        title: Text(input.hintText, style: TextStyle(color: Color(0xff9B9B9B))),
      ),
    );
  }

  void _handleComboboxTap(BuildContext ctx) {
    Navigator.of(ctx)
        .push(MaterialPageRoute(builder: (context) => ComboboxListPage()));
  }
}
