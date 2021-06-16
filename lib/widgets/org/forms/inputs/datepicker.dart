import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DatePicker extends StatefulWidget {
  final String value;
  final Function onChanged;
  final String label;
  final String hintText;
  final String errorText;

  DatePicker({
    @required this.label,
    @required this.value,
    @required this.onChanged,
    this.hintText,
    this.errorText,
  });

  @override
  _DatePickerState createState() => _DatePickerState(
        label: label,
        hintText: hintText,
        value: value,
        onChanged: onChanged,
        errorText: errorText,
      );
}

class _DatePickerState extends State<DatePicker> {
  String value;
  final Function onChanged;
  final String label;
  final String hintText;
  String errorText;

  _DatePickerState({
    @required this.label,
    @required this.value,
    @required this.onChanged,
    this.hintText,
    this.errorText,
  });

  @override
  Widget build(BuildContext ctx) {
    return TextButton(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(
              Icons.calendar_today,
              color: Color(0xff9B9B9B),
            ),
          ),
          Text(
            value != null ? value : hintText,
            style: TextStyle(color: Color(0xff9B9B9B)),
          ),
        ],
      ),
      onPressed: () => _handleTapDatePicker(ctx),
    );
  }

  void _handleTapDatePicker(BuildContext ctx) async {
    DateTime date = await showDatePicker(
        context: ctx,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2022));
    String formattedDate = formatDate(date, [dd, '/', mm, '/', yyyy]);
    this.setState(() {
      value = formattedDate;
    });
    // ! fix: there are something wrong here
    if (onChanged != null) onChanged(formattedDate);
  }
}
