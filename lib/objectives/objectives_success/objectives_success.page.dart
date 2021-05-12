import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/widgets/button.dart';

class ObjectivesSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Pronto!'),
        titleTextStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      body: Container(
        child: Column(
          children: [
            Image.asset('lib/objectives/objectives_success/assets/target.png'),
            Text('Agora é só cadastrar suas tarefas e atividades'),
            PrimaryButton('Começar!'),
          ],
        ),
      ),
    );
  }
}
