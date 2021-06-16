import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/app/home/sidemenu/weekly_productivity/chart_bar.dart';

class TCChart extends StatelessWidget {
  final List<Map<String, Object>> tasks;

  TCChart(this.tasks);

  double get _weekTotalCount {
    return tasks.fold(0.0, (prev, _) => prev + 1);
  }

  @override
  Widget build(BuildContext ctx) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(7),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (Map<String, Object> task in tasks)
              TCChartBar(
                label: task['day'],
                percentage: (task['count'] as double) / _weekTotalCount,
                value: task['count'],
              )
          ],
        ),
      ),
    );
  }
}
