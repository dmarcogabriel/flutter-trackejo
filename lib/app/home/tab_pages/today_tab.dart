import 'dart:core';
import 'package:date_format/date_format.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/app/home/home.page.dart';
import 'package:flutter_trackejo/helpers/date_time.dart';
import 'package:flutter_trackejo/providers/tasks.dart';
import 'package:flutter_trackejo/widgets/page.dart';
import 'package:flutter_trackejo/widgets/views/task_list.dart';

class TodayTab extends StatelessWidget {
  final List<Task> tasks;
  final TabPage tabPage;

  TodayTab({@required this.tasks, @required this.tabPage});

  @override
  Widget build(BuildContext ctx) {
    List<Task> todayTasks = tasks.where((task) {
      String today = DateTimeHelper.getFormattedToday();
      return task.deadline == today;
    }).toList();

    return PageContainer(
      TaskList(
          title: tabPage.title,
          subTitle: tabPage.subTitle,
          tasks: todayTasks ?? []),
      noHeader: true,
    );
  }
}
