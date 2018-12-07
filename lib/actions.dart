import 'package:tasks/models/task.dart';

enum Actions { ADD_TASK, UPDATE_TASK, DELETE_TASK }

class AddTaskAction {
  final Task task;

  AddTaskAction(this.task);
}

class DeleteTaskAction {
  final Task task;

  DeleteTaskAction(this.task);
}
