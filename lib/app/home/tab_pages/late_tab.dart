import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/app/home/home.page.dart';
import 'package:flutter_trackejo/helpers/date_time.dart';
import 'package:flutter_trackejo/providers/tasks.dart';
import 'package:flutter_trackejo/widgets/page.dart';
import 'package:flutter_trackejo/widgets/views/task_list.dart';

class LateTab extends StatelessWidget {
  final List<Task> tasks;
  final TabPage tabPage;

  LateTab({@required this.tasks, @required this.tabPage});

  @override
  Widget build(BuildContext ctx) {
    List<Task> lateTasks = tasks.where((task) {
      DateTime date = DateTimeHelper.parseFormattedDateString(task.deadline);
      String today = DateTimeHelper.getFormattedToday();
      return task.deadline != today && date.isBefore(DateTime.now());
    }).toList();

    return PageContainer(
      TaskList(
          title: tabPage.title,
          subTitle: tabPage.subTitle,
          tasks: lateTasks ?? []),
      noHeader: true,
    );
  }
}
