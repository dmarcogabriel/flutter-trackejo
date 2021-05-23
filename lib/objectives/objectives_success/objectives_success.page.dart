import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/objectives/widgets/atm/title.dart';
import 'package:flutter_trackejo/objectives/widgets/confirm_button.dart';
import 'package:flutter_trackejo/widgets/page.dart';

class ObjectivesSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: AppTitle('Pronto!'),
          centerTitle: true),
      body: PageContainer(
        Column(
          children: [
            Container(
              child: Image.asset(
                  'lib/objectives/objectives_success/assets/target.png'),
              margin: EdgeInsets.symmetric(vertical: 28),
            ),
            Text(
              'Agora é só cadastrar suas tarefas e atividades',
            ),
            ConfirmButton(
              text: 'Começar!',
              onPressed: () => _navigateToHome(ctx),
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
