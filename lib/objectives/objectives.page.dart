import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trackejo/objectives/widgets/title_section.dart';
import 'package:flutter_trackejo/widgets/button.dart';
import 'option.dart';

class Objectives extends StatefulWidget {
  @override
  _ObjectivesState createState() => _ObjectivesState();
}

class _ObjectivesState extends State<Objectives> {
  List<Option> options = [
    Option('o1', 'Aumentar minha produtividade', Icons.access_time),
    Option('o2', 'Construir bons hábitos', Icons.local_florist),
    Option('o3', 'Ficar saudável e em forma', Icons.volunteer_activism),
    Option('o4', 'Melhorar minha rotina', Icons.show_chart_sharp),
  ];

  void _selectOption(Option option) {
    setState(() {
      options.forEach((Option op) {
        if (option.key == op.key) {
          op.isSelected = !op.isSelected;
        }
        return op;
      });
    });
  }

  void _confirm(BuildContext context) {
    // todo: validate options quantity
    // todo: navigate to next page
    // todo: save user options
    Navigator.pushNamed(context, '/success');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TitleSection(),
          _buildOptionList(),
          // todo: add enable navigation button condition
          PrimaryButton('Confirmar', onPressed: () => _confirm(context)),
        ],
      ),
    );
  }

  Widget _buildOptionButton(Option option) => PrimaryButton(
        option.label,
        onPressed: () => _selectOption(option),
        icon: option.icon,
        backgroundColor: MaterialStateProperty.all(
            option.isSelected ? Colors.green : Colors.blue),
      );

  Widget _buildOptionList() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (Option option in options) _buildOptionButton(option),
        ],
      ),
    );
  }
}
