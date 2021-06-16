import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TCChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  TCChartBar({
    @required this.label,
    @required this.percentage,
    @required this.value,
  });

  @override
  Widget build(BuildContext ctx) {
    return Column(
      children: [
        SizedBox(
          height: 4,
        ),
        Container(
          height: 120,
          width: 16,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                  decoration: BoxDecoration(
                color: Color(0xffF0F0F0),
                borderRadius: BorderRadius.circular(10),
              )),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                    decoration: BoxDecoration(
                  color: Theme.of(ctx).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        FittedBox(
          child: Text(label),
        )
      ],
    );
  }
}
