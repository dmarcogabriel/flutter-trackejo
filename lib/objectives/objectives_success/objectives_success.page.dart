import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/widgets/atm/headings.dart';
import 'package:flutter_trackejo/widgets/mol/primary_button.dart';
import 'package:flutter_trackejo/widgets/page.dart';

class ObjectivesSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Heading1(title: 'Pronto!'),
          centerTitle: true),
      body: PageContainer(
        Column(
          children: [
            Container(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 35),
              child: Image.asset(
                  'lib/objectives/objectives_success/assets/target.png'),
            )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 7),
              child: Text(
                'Agora é só cadastrar suas tarefas e atividades',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 64),
              child: PrimaryButton(
                text: 'Começar!',
                onPressed: () => _navigateToHome(ctx),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToHome(context) {
    Navigator.pushNamed(context, '/home');
  }
}
