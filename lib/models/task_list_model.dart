import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uuid/uuid.dart';

class Task {
  final String id;
  String title;
  String description;
  bool checked;

  Task(this.title, {this.description, this.checked = false, id})
      : this.id = id ?? Uuid().v4();
}

class TaskListModel extends Model {
  final List<Task> _tasks = [
    Task('Hello, world'),
    Task('Hello, description', description: 'Description')
  ];

  List<Task> get tasks => _tasks.toList();

  static TaskListModel of(BuildContext context) =>
      ScopedModel.of<TaskListModel>(context);

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    var _task = _tasks.firstWhere((it) => it.id == task.id);
    var index = _tasks.indexOf(_task);
    _tasks.replaceRange(index, index + 1, [task]);
    notifyListeners();
  }

  void removeTask(Task task) {
    var index = _tasks.indexOf(task);
    _tasks.removeRange(index, index + 1);
    notifyListeners();
  }
}
