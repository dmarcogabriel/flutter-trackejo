import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Choice {
  String label;
  int value;
  bool isSelected;

  Choice({@required this.label, @required this.value, this.isSelected = false});
}

class ChipsInput extends StatefulWidget {
  final String label;
  final String errorMessage;
  final void Function(Choice) onChanged;
  final List<Choice> choices;
  final bool isMultiSelect;
  final String hintText;
  final bool addMoreButton;

  ChipsInput({
    @required this.label,
    @required this.onChanged,
    @required this.choices,
    this.errorMessage,
    this.isMultiSelect,
    this.hintText,
    this.addMoreButton,
  });

  @override
  _ChipsInputState createState() => _ChipsInputState(
        label: label,
        onChanged: onChanged,
        choices: choices,
        isMultiSelect: isMultiSelect,
        hintText: hintText,
        addMoreButton: addMoreButton,
        errorMessage: errorMessage,
      );
}

class _ChipsInputState extends State<ChipsInput> {
  String errorMessage;
  List<Choice> choices;
  final String label;
  final void Function(Choice) onChanged;
  final bool isMultiSelect;
  final String hintText;
  final bool addMoreButton;

  _ChipsInputState({
    @required this.label,
    @required this.onChanged,
    @required this.choices,
    this.errorMessage,
    this.isMultiSelect,
    this.hintText = '',
    this.addMoreButton,
  });

  @override
  Widget build(BuildContext ctx) {
    List<Widget> children = choices
        .map((choice) => ChoiceChip(
              label: Text(choice.label),
              selected: choice.isSelected,
              onSelected: (selected) => _handleChanged(choice, selected),
            ))
        .toList();

    return InputDecorator(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        errorText: errorMessage,
      ),
      child: Wrap(alignment: WrapAlignment.spaceAround, children: children),
    );
  }

  void _handleChanged(Choice choice, bool selected) {
    this.setState(() {
      if (isMultiSelect == true) {
        choice.isSelected = selected;
      } else
        choices.forEach((el) {
          if (el.value == choice.value)
            el.isSelected = selected;
          else
            el.isSelected = false;
        });
      onChanged(choice);
    });
  }

  void _handleAddMoreChoices(bool selected) {
    print('é pra add mais');
    // todo: button logic must not be here
    // ! todo: open new page
    // !  todo: onclose page add new ticket
    // !  todo: refresh tickets
  }
}
