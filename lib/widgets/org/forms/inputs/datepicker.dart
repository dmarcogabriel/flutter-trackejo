import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/widgets/org/forms/inputs/input.interface.dart';

class DatePickerInput implements InputInterface {
  String label;
  String hintText;

  DatePickerInput({@required this.label, this.hintText});
}

class DatePicker extends StatefulWidget {
  final DatePickerInput input;
  final String value;
  final Function onChanged;

  DatePicker(
      {@required this.input, @required this.value, @required this.onChanged});

  @override
  _DatePickerState createState() =>
      _DatePickerState(input: input, value: value, onChanged: onChanged);
}

class _DatePickerState extends State<DatePicker> {
  DatePickerInput input;
  String value;
  Function onChanged;

  _DatePickerState(
      {@required this.input, @required this.value, @required this.onChanged});

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
            value != null ? value : input.hintText,
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
