import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/providers/tasks.dart';
import 'package:flutter_trackejo/widgets/views/page.dart';
import 'package:flutter_trackejo/widgets/views/task_list.dart';
import 'package:provider/provider.dart';

class TasksDone extends StatefulWidget {
  @override
  _TasksDoneState createState() => _TasksDoneState();
}

class _TasksDoneState extends State<TasksDone> {
  List<Task> _filterDoneTasks(List<Task> tasks) {
    return tasks.where((task) => task.done).toList();
  }

  @override
  Widget build(BuildContext ctx) {
    return Consumer<TasksProvider>(builder: (_, provider, child) {
      List<Task> _tasks = _filterDoneTasks(provider.tasks);

      return PageContainer(
        title: PageTitle(title: 'Tarefas Concluídas'),
        child: TaskList(
          title: 'Concluídas',
          subTitle: 'Confira as tarefas que você já concluíu.',
          tasks: _tasks,
        ),
      );
    });
  }
}
