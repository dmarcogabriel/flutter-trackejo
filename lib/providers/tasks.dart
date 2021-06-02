import 'package:flutter/material.dart';
import 'package:flutter_trackejo/widgets/org/forms/inputs/chips.dart';

class Task {
  String color;
  String text;
  bool done;
  Choice priority;
  Choice ticket;
  String deadline;

  Task(
      {@required this.text,
      @required this.priority,
      @required this.deadline,
      this.ticket,
      this.color,
      this.done});
}

class TasksProvider {
  List<Task> tasks;

  TasksProvider() : tasks = [];

  List<Task> getTasks() {
    return tasks;
  }

  Task createTask(Task task) {
    this.tasks.add(task);
    return task;
  }
}
