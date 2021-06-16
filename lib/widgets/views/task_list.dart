import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/providers/tasks.dart';
import 'package:flutter_trackejo/helpers/snackbar.dart';
import 'package:flutter_trackejo/widgets/atm/sub_title.dart';
import 'package:flutter_trackejo/widgets/atm/ticket_status.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  final String title;
  final String subTitle;
  final List<Task> tasks;

  TaskList({@required this.title, @required this.tasks, this.subTitle});

  @override
  _TaskListState createState() =>
      _TaskListState(title: title, subTitle: subTitle, tasks: tasks);
}

class _TaskListState extends State<TaskList> {
  String title;
  String subTitle;
  List<Task> tasks;

  _TaskListState({@required this.title, @required this.tasks, this.subTitle});

  @override
  Widget build(BuildContext ctx) {
    return ListView(
      children: [
        AppSubTitle(title),
        Text(subTitle ?? ''),
        Column(
            children: tasks
                .map((task) => ListTile(
                      leading: TicketStatus(
                        color: Theme.of(ctx).primaryColor,
                      ),
                      title: Text(task.text),
                      subtitle: task.deadline != null
                          ? Text(task.deadline)
                          : Text(''),
                      onTap: () => _handleTapTask(ctx, task),
                      trailing: Radio(
                        activeColor: Theme.of(ctx).primaryColor,
                        value: true,
                        groupValue: task.done,
                        onChanged: (value) => _handleTapTask(ctx, task),
                      ),
                    ))
                .toList())
      ],
    );
  }

  void _handleTapTask(BuildContext ctx, Task task) async {
    bool done = !task.done;
    this.setState(() {
      task.done = done;
    });
    Provider.of<TasksProvider>(ctx, listen: false).updateTask(task);
    if (done == true) {
      TCSnackbar.showSnackbar(
          ctx: ctx,
          text: 'Tarefa concluída',
          label: 'Desfazer',
          onPressed: () => _onDismissDoneTask(task));
    }
  }

  void _onDismissDoneTask(Task task) {
    this.setState(() {
      task.done = false;
    });
  }
}
