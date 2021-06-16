import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trackejo/app/objectives/objectives_success/objectives_success.page.dart';
import 'package:flutter_trackejo/app/objectives/widgets/objective_option.dart';
import 'package:flutter_trackejo/app/objectives/widgets/title_section.dart';
import 'package:flutter_trackejo/providers/user.dart';
import 'package:flutter_trackejo/widgets/mol/primary_button.dart';
import 'package:flutter_trackejo/widgets/page.dart';
import 'package:provider/provider.dart';

class ObjectivesPage extends StatefulWidget {
  @override
  _ObjectivesPageState createState() => _ObjectivesPageState();
}

class _ObjectivesPageState extends State<ObjectivesPage> {
  List<Objective> options = [
    Objective('o1', 'Aumentar minha produtividade', Icons.access_time),
    Objective('o2', 'Construir bons hábitos', Icons.local_florist),
    Objective('o3', 'Ficar saudável e em forma', Icons.volunteer_activism),
    Objective('o4', 'Melhorar minha rotina', Icons.show_chart_sharp),
  ];

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: PageContainer(
        Column(
          children: [
            TitleSection(),
            _buildOptionList(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 64),
              child: PrimaryButton(
                text: 'Continuar',
                onPressed: () => _confirm(ctx),
                isDisabled: _noOptionSelected(),
              ),
            )
          ],
        ),
        noHeader: true,
      ),
    );
  }

  Widget _buildOptionList() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (Objective option in options)
            ObjectiveOption(
              icon: option.icon,
              text: option.label,
              isSelected: option.isSelected,
              onPressed: () => _selectOption(option),
            ),
        ],
      ),
    );
  }

  void _selectOption(Objective selectedOption) {
    setState(() {
      options.forEach((Objective option) {
        if (selectedOption.key == option.key) {
          option.isSelected = !option.isSelected;
        }
        return option;
      });
    });
  }

  void _confirm(BuildContext ctx) {
    UserProvider userProvider = Provider.of<UserProvider>(ctx, listen: false);
    List<Objective> objectives =
        options.where((option) => option.isSelected).toList();

    userProvider.saveObjectives(objectives);
    Navigator.of(ctx)
        .push(MaterialPageRoute(builder: (_) => ObjectivesSuccess()));
  }

  bool _noOptionSelected() {
    List<Objective> selectedOptions =
        options.where((option) => option.isSelected).toList();
    return selectedOptions.isEmpty;
  }
}
