import 'package:flutter/widgets.dart';

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Container(
        padding: EdgeInsets.all(32),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('Escolha pelo menos uma opção abaixo')
                ],
              ),
            )
          ],
        ));
  }
}
