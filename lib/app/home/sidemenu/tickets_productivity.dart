import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/widgets/atm/headings.dart';
import 'package:flutter_trackejo/widgets/atm/ticket_status.dart';
import 'package:flutter_trackejo/widgets/views/page.dart';
import 'package:fl_chart/fl_chart.dart';

class TicketsProductivity extends StatefulWidget {
  @override
  _TicketsProductivityState createState() => _TicketsProductivityState();
}

class _TicketsProductivityState extends State<TicketsProductivity> {
  @override
  Widget build(BuildContext ctx) {
    return PageContainer(
        title: PageTitle(title: 'Produtividade da Semana'),
        child: Column(
          children: [
            AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      sections:
                          List.generate(4, (index) => PieChartSectionData())),
                  // swapAnimationDuration: Duration(milliseconds: 150), // Optional
                  // swapAnimationCurve: Curves.linear,
                )),
            Heading2(title: 'Etiquetas'),
            Column(
              children: List.generate(
                  4,
                  (index) => ListTile(
                        title: Text("Etiqueta ${index + 1}"),
                        leading: TicketStatus(
                          color: Theme.of(ctx).primaryColor,
                        ),
                        trailing: Text('4$index'),
                      )),
            ),
          ],
        ));
  }
}
