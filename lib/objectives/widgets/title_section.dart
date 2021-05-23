import 'package:flutter/widgets.dart';
import 'atm/title.dart';

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Container(
        padding: EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: AppTitle('Quais são seus objetivos?'),
                  ),
                  Text(
                    'Escolha pelo menos uma opção abaixo',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
