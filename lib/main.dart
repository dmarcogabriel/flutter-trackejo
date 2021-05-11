import 'package:flutter/material.dart';
import 'package:flutter_trackejo/widgets/button.dart';

void main() {
  runApp(Trackejo());
}

class Option {
  String key;
  String label;
  IconData icon;
  bool isSelected;

  Option(this.key, this.label, this.icon, {this.isSelected = false});
}

class TrackejoState extends State<Trackejo> {
  List<Option> options = [
    Option('o1', 'Aumentar minha produtividade', Icons.access_time),
    Option('o2', 'Construir bons hábitos', Icons.local_florist),
    Option('o3', 'Ficar saudável e em forma', Icons.volunteer_activism),
    Option('o4', 'Melhorar minha rotina', Icons.show_chart_sharp),
  ];

  void selectOption(Option option) {
    setState(() {
      options.forEach((Option op) {
        if (option.key == op.key) {
          op.isSelected = !op.isSelected;
        }
        return op;
      });
    });
  }

  void confirm() {
    // todo: navigate to next page
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Trackejo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Column(
            children: [
              _titleSection,
              _buildOptionList(),
              // todo: add enable navigation button condition
              PrimaryButton('Confirmar', onPressed: null),
            ],
          ),
        ));
  }

  final Widget _titleSection = Container(
    padding: EdgeInsets.all(16),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Quais são seus objetivos?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text('Escolha pelo menos uma opção abaixo')
            ],
          ),
        )
      ],
    ),
  );

  Widget _buildOptionButton(Option option) => PrimaryButton(
        option.label,
        onPressed: () => selectOption(option),
        icon: option.icon,
        backgroundColor: MaterialStateProperty.all(
            option.isSelected ? Colors.green : Colors.blue),
      );

  Widget _buildOptionList() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildOptionButton(options[0]),
          _buildOptionButton(options[1]),
          _buildOptionButton(options[2]),
          _buildOptionButton(options[3]),
        ],
      ),
    );
  }
}

class Trackejo extends StatefulWidget {
  @override
  TrackejoState createState() => TrackejoState();
}
