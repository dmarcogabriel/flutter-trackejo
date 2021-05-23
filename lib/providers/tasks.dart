class Task {
  String color;
  String text;
  bool done;

  Task(this.text, {this.color, this.done});
}

class TasksProvider {
  List<Task> tasks;

  TasksProvider() : tasks = [Task('Teste', done: false)];

  List<Task> getTasks() {
    return tasks;
  }

  Task createTask(String text) {
    Task task = Task(text, color: 'black', done: false);
    this.tasks.add(task);
    return task;
  }
}
