import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/app/home/home.page.dart';
import 'package:flutter_trackejo/helpers/date_time.dart';
import 'package:flutter_trackejo/providers/tasks.dart';
import 'package:flutter_trackejo/widgets/page.dart';
import 'package:flutter_trackejo/widgets/views/task_list.dart';
import 'package:provider/provider.dart';

class LateTab extends StatelessWidget {
  final TabPage tabPage;

  LateTab({@required this.tabPage});

  List<Task> _filterLateTasks(List<Task> tasks) {
    return tasks.where((task) {
      DateTime date = DateTimeHelper.parseFormattedDateString(task.deadline);
      String today = DateTimeHelper.getFormattedToday();
      return task.deadline != today && date.isBefore(DateTime.now());
    }).toList();
  }

  @override
  Widget build(BuildContext ctx) {
    return Consumer<TasksProvider>(builder: (_, provider, child) {
      List<Task> _tasks = _filterLateTasks(provider.tasks);

      return PageContainer(
        TaskList(
          title: tabPage.title,
          subTitle: tabPage.subTitle,
          tasks: _tasks,
        ),
        noHeader: true,
      );
    });
  }
}
