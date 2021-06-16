import 'package:flutter/widgets.dart';

class TicketStatus extends StatelessWidget {
  final Color color;

  TicketStatus({@required this.color});

  @override
  Widget build(BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(2.5))),
        )
      ],
    );
  }
}
