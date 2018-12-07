import 'package:tasks/models/task.dart';

class AddTaskAction {
  final Task task;

  AddTaskAction(this.task);
}

class DeleteTaskAction {
  final Task task;

  DeleteTaskAction(this.task);
}
