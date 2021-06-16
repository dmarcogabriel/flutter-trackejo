import 'package:flutter/material.dart';

class Task {
  String color;
  String text;
  bool done;
  String priority;
  String ticket;
  String deadline;

  Task({
    @required this.text,
    @required this.priority,
    @required this.deadline,
    this.ticket,
    this.color,
    this.done,
  });
}

class TasksProvider {
  List<Task> tasks = [];

  List<Task> getTasks() {
    return tasks;
  }

  Task createTask(Task task) {
    this.tasks.add(task);
    return task;
  }
}
