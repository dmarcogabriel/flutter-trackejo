import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Task {
  int id;
  int color;
  String text;
  bool done;
  String priority;
  String ticket;
  String deadline;

  Task({
    @required this.text,
    @required this.priority,
    this.id,
    this.deadline,
    this.ticket,
    this.color,
    this.done,
  });
}

class TasksProvider with ChangeNotifier {
  List<Task> _tasks = [
    Task(
      text: 'Tarefa de domingo',
      priority: 'Média',
      done: true,
      color: 0xff000000,
      deadline: '13/04/2021',
      id: 99,
      ticket: 'Treino',
    ),
    Task(
      text: 'Tarefa muito antiga',
      priority: 'Média',
      done: true,
      color: 0xff000000,
      deadline: '12/04/2021',
      id: 100,
      ticket: 'Faculdade',
    ),
    Task(
      text: 'Tarefa um pouco antiga',
      priority: 'Média',
      done: true,
      color: 0xff000000,
      deadline: '12/06/2021',
      id: 101,
      ticket: 'Faculdade',
    ),
    Task(
      text: 'Tarefa pra sexta',
      priority: 'Média',
      done: true,
      color: 0xff000000,
      deadline: '18/06/2021',
      id: 103,
      ticket: 'Faculdade',
    ),
  ];

  List<Task> get tasks => [..._tasks];

  Future<Task> createTask(Task task) async {
    task.id = _tasks.length;
    _tasks.add(task);
    await _saveTask(task);
    notifyListeners();
    return task;
  }

  Future<void> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasks = prefs.getStringList('@app_tasks');
    List<Task> savedTasks = [];
    if (tasks != null) {
      tasks.forEach((task) {
        savedTasks.add(_taskParse(task));
      });
      _tasks = savedTasks;
      notifyListeners();
    }
  }

  void updateTask(Task updatedTask) async {
    final updatedTasks = _tasks.map((task) {
      if (task.id == updatedTask.id) {
        return updatedTask;
      }
      return task;
    }).toList();
    await _updateTasksOnStorage(updatedTasks);
    _tasks = [...updatedTasks];
    notifyListeners();
  }

  Task _taskParse(String jsonTask) {
    dynamic task = jsonDecode(jsonTask);
    return Task(
      id: task['id'],
      text: task['text'],
      priority: task['priority'],
      color: task['color'],
      deadline: task['deadline'],
      done: task['done'],
      ticket: task['ticket'],
    );
  }

  String _taskStringify(Task task) {
    return jsonEncode({
      'id': task.id,
      'color': task.color,
      'deadline': task.deadline,
      'done': task.done,
      'priority': task.priority,
      'text': task.text,
      'ticket': task.ticket,
    });
  }

  Future<void> _saveTask(Task task) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasks = prefs.getStringList('@app_tasks');
    print(tasks);
    if (tasks == null) {
      await prefs.setStringList('@app_tasks', [_taskStringify(task)]);
    } else {
      tasks.add(_taskStringify(task));
      await prefs.setStringList('@app_tasks', tasks);
    }
  }

  Future<void> _updateTasksOnStorage(List<Task> tasks) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasksToSave =
        tasks.map((task) => _taskStringify(task)).toList();
    await prefs.setStringList('@app_tasks', [...tasksToSave]);
  }
}
