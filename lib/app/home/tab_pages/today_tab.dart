import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/app/home/home.page.dart';
import 'package:flutter_trackejo/helpers/date_time.dart';
import 'package:flutter_trackejo/providers/tasks.dart';
import 'package:flutter_trackejo/widgets/page.dart';
import 'package:flutter_trackejo/widgets/views/task_list.dart';
import 'package:provider/provider.dart';

class TodayTab extends StatelessWidget {
  final TabPage tabPage;

  TodayTab({@required this.tabPage});

  List<Task> _filterTodayTasks(List<Task> tasks) {
    return tasks.where((task) {
      String today = DateTimeHelper.getFormattedToday();
      return task.deadline == today;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
        builder: (BuildContext context, provider, child) {
      final _tasks = _filterTodayTasks(provider.tasks);
      print(_tasks);
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
