import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/providers/tasks.dart';
import 'package:flutter_trackejo/widgets/views/page.dart';
import 'package:flutter_trackejo/widgets/views/task_list.dart';

class TasksDone extends StatefulWidget {
  @override
  _TasksDoneState createState() => _TasksDoneState();
}

class _TasksDoneState extends State<TasksDone> {
  @override
  Widget build(BuildContext ctx) {
    return PageContainer(
      title: PageTitle(title: 'Produtividade da Semana'),
      child: TaskList(
        title: 'Concluídas',
        subTitle: 'Confira as tarefas que você já concluíu.',
        tasks: List.generate(
            5,
            (index) => Task(
                text: 'This is a task $index',
                priority: 'Média',
                deadline: '12/13/200$index',
                done: true)),
      ),
    );
  }
}
