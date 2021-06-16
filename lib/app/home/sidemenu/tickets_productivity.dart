import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/providers/tasks.dart';
import 'package:flutter_trackejo/providers/ticket.provider.dart';
import 'package:flutter_trackejo/widgets/atm/headings.dart';
import 'package:flutter_trackejo/widgets/atm/ticket_status.dart';
import 'package:flutter_trackejo/widgets/views/page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

class TicketsProductivity extends StatefulWidget {
  @override
  _TicketsProductivityState createState() => _TicketsProductivityState();
}

class _TicketsProductivityState extends State<TicketsProductivity> {
  List<TicketClass> _filterByTickets(
    List<TicketClass> tickets,
    List<Task> tasks,
  ) {
    return tickets.map((ticket) {
      ticket.tasks = tasks.where((task) {
        return task.ticket == ticket.text;
      }).toList();
      return ticket;
    }).toList();
  }

  List<TicketClass> _filterTicketsWithTasks(List<TicketClass> tickets) {
    return tickets.where((ticket) => ticket.tasks.length > 0).toList();
  }

  // TODO: implement colors
  @override
  Widget build(BuildContext ctx) {
    return Consumer<TasksProvider>(builder: (_, taskProvider, child) {
      return Consumer<TicketProvider>(builder: (_, ticketProvider, child) {
        final _tickets =
            _filterByTickets(ticketProvider.tickets, taskProvider.tasks);

        return PageContainer(
            title: PageTitle(title: 'Produtividade por Etiqueta'),
            child: ListView(
              children: [
                AspectRatio(
                    aspectRatio: 3 / 2,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          for (TicketClass _ticket
                              in _filterTicketsWithTasks(_tickets))
                            PieChartSectionData(
                              value: _ticket.tasks.length.toDouble(),
                            )
                        ],
                      ),
                      // sections: List.generate(
                      //     4, (index) => PieChartSectionData(value: 3))),
                      // swapAnimationDuration: Duration(milliseconds: 150), // Optional
                      // swapAnimationCurve: Curves.linear,
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 21),
                  child: Column(
                    children: [
                      Heading2(title: 'Etiquetas'),
                      Column(
                        children: [
                          for (TicketClass _ticket in _tickets)
                            ListTile(
                              title: Text(_ticket.text),
                              leading: TicketStatus(
                                //todo: this must be dynamic
                                color: Theme.of(ctx).primaryColor,
                              ),
                              trailing: Text(_ticket.tasks.length.toString()),
                            )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ));
      });
    });
  }
}
