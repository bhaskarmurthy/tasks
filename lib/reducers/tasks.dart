import 'package:redux/redux.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/actions/tasks.dart';

final tasksReducer = combineReducers<List<Task>>([
  TypedReducer<List<Task>, AddTaskAction>(_addTask),
  TypedReducer<List<Task>, DeleteTaskAction>(_deleteTask),
]);

List<Task> _addTask(List<Task> tasks, AddTaskAction action) {
  return List.from(tasks)..add(action.task);
}

List<Task> _deleteTask(List<Task> tasks, DeleteTaskAction action) {
  return tasks.where((task) => task.id != task.id).toList();
}
