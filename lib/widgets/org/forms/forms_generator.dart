import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormsGenerator extends StatefulWidget {
  final List<dynamic> inputs;

  FormsGenerator({@required this.inputs});

  @override
  _FormsGeneratorState createState() => _FormsGeneratorState(inputs: inputs);
}

class _FormsGeneratorState extends State<FormsGenerator> {
  List<dynamic> inputs;

  _FormsGeneratorState({@required this.inputs});

  @override
  Widget build(BuildContext ctx) {
    return Form(
      child: Column(
        children: [
          for (dynamic input in inputs)
            Padding(padding: EdgeInsets.symmetric(vertical: 7), child: input)
        ],
      ),
    );
  }
}
