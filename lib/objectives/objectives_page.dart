import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trackejo/objectives/widgets/confirm_button.dart';
import 'package:flutter_trackejo/objectives/widgets/title_section.dart';
import 'package:flutter_trackejo/widgets/button.dart';
import 'package:flutter_trackejo/widgets/page.dart';
import 'option.dart';

class ObjectivesPage extends StatefulWidget {
  @override
  _ObjectivesPageState createState() => _ObjectivesPageState();
}

class _ObjectivesPageState extends State<ObjectivesPage> {
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
    // todo: save user options
    Navigator.pushNamed(context, '/success');
  }

  bool _hasOneSelected() {
    bool oneOptionSelected = false;
    options.forEach((option) {
      if (option.isSelected) oneOptionSelected = true;
    });
    return oneOptionSelected;
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: PageContainer(
        Column(
          children: [
            TitleSection(),
            _buildOptionList(),
            ConfirmButton(
              text: 'Continuar',
              onPressed: () => _confirm(ctx),
              isDisabled: !_hasOneSelected(),
            )
          ],
        ),
        noHeader: true,
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
