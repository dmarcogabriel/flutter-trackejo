import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/app/home/home.page.dart';
import 'package:flutter_trackejo/helpers/date_time.dart';
import 'package:flutter_trackejo/providers/tasks.dart';
import 'package:flutter_trackejo/widgets/page.dart';
import 'package:flutter_trackejo/widgets/views/task_list.dart';
import 'package:provider/provider.dart';

class NextTab extends StatelessWidget {
  final TabPage tabPage;

  NextTab({@required this.tabPage});

  List<Task> _filterNextTasks(List<Task> tasks) {
    print('tasks on next');
    print(tasks);
    return tasks.where((task) {
      DateTime date = DateTimeHelper.parseFormattedDateString(task.deadline);
      String today = DateTimeHelper.getFormattedToday();
      return task.deadline != today && date.isAfter(DateTime.now());
    }).toList();
  }

  @override
  Widget build(BuildContext ctx) {
    return Consumer<TasksProvider>(
      builder: (BuildContext context, provider, child) {
        final _tasks = _filterNextTasks(provider.tasks);

        return PageContainer(
          TaskList(
            title: tabPage.title,
            subTitle: tabPage.subTitle,
            tasks: _tasks,
          ),
          noHeader: true,
        );
      },
    );
  }
}
