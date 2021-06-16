import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/app/home/sidemenu/weekly_productivity/chart.dart';
import 'package:flutter_trackejo/helpers/date_time.dart';
import 'package:flutter_trackejo/providers/tasks.dart';
import 'package:flutter_trackejo/widgets/atm/headings.dart';
import 'package:flutter_trackejo/widgets/atm/ticket_status.dart';
import 'package:flutter_trackejo/widgets/views/page.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductivityWeekly extends StatefulWidget {
  @override
  _ProductivityWeeklyState createState() => _ProductivityWeeklyState();
}

class _ProductivityWeeklyState extends State<ProductivityWeekly> {
  List<Task> _filterRecentTasks(List<Task> tasks) {
    return tasks.where((task) {
      DateTime date = DateTimeHelper.parseFormattedDateString(task.deadline);
      return date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  List<Map<String, Object>> _groupTasks(List<Task> tasks) {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double tasksCount = 0.0;

      for (int i = 0; i < tasks.length; i++) {
        DateTime deadline =
            DateTimeHelper.parseFormattedDateString(tasks[i].deadline);
        bool sameDay = deadline.day == weekDay.day;
        bool sameMonth = deadline.month == weekDay.month;
        bool sameYear = deadline.year == weekDay.year;
        if (sameDay && sameMonth && sameYear) tasksCount += 1;
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 3),
        'count': tasksCount,
      };
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Consumer<TasksProvider>(builder: (_, provider, child) {
      List<Task> _tasks = _filterRecentTasks(provider.tasks);
      List<Map<String, Object>> _groupedTasks = _groupTasks(_tasks);

      return PageContainer(
          title: PageTitle(title: 'Produtividade da Semana'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TCChart(_groupedTasks.reversed.toList()),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 7),
                child: Heading2(title: 'Produtividade nos últimos 7 dias'),
              ),
              Column(
                children: [
                  for (final task in _groupedTasks)
                    ListTile(
                      title: Text(task['day'].toString()),
                      leading: TicketStatus(
                        color: Theme.of(ctx).primaryColor,
                      ),
                      trailing:
                          Text((task['count'] as double).toStringAsFixed(0)),
                    )
                ],
              ),
            ],
          ));
    });
  }
}
