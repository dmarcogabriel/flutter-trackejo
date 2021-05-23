import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/providers/tasks.dart';
import 'package:flutter_trackejo/widgets/atm/sub_title.dart';
import 'package:provider/provider.dart';

class TasksView extends StatefulWidget {
  final String title;
  final String subTitle;

  TasksView(this.title, this.subTitle);

  @override
  _TasksViewState createState() => _TasksViewState(title, subTitle: subTitle);
}

class _TasksViewState extends State<TasksView> {
  String title;
  String subTitle;
  String value = '';
  List<Task> tasks;

  _TasksViewState(this.title, {this.subTitle});

  @override
  Widget build(BuildContext ctx) {
    TasksProvider tasksProvider = Provider.of<TasksProvider>(ctx);

    print(tasksProvider.getTasks());
    tasks = tasksProvider.getTasks();

    return Column(
      children: [
        AppSubTitle(title),
        Text(subTitle ?? ''),
        Column(
          children: [
            for (Task task in tasks)
              ListTile(
                leading: _setTicketStyle(),
                title: Text(task.text),
                trailing: Radio(
                  value: 'task_done',
                  groupValue: value,
                  onChanged: (value) {
                    setState(() {
                      this.value = value;
                    });
                  },
                ),
              )
          ],
        )
      ],
    );
  }

  Widget _setTicketStyle({Color color = Colors.blue}) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(2.5))),
    );
  }
}
