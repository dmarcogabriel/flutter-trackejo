import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/app/home/home.page.dart';
import 'package:flutter_trackejo/helpers/date_time.dart';
import 'package:flutter_trackejo/providers/tasks.dart';
import 'package:flutter_trackejo/widgets/page.dart';
import 'package:flutter_trackejo/widgets/views/task_list.dart';

class NextTab extends StatelessWidget {
  final List<Task> tasks;
  final TabPage tabPage;

  NextTab({@required this.tasks, @required this.tabPage});

  @override
  Widget build(BuildContext ctx) {
    List<Task> nextTasks = tasks.where((task) {
      DateTime date = DateTimeHelper.parseFormattedDateString(task.deadline);
      String today = DateTimeHelper.getFormattedToday();
      return task.deadline != today && date.isAfter(DateTime.now());
    }).toList();

    return PageContainer(
      TaskList(
          title: tabPage.title,
          subTitle: tabPage.subTitle,
          tasks: nextTasks ?? []),
      noHeader: true,
    );
  }
}
