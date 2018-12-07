import 'package:meta/meta.dart';
import 'package:tasks/models/task.dart';

@immutable
class AppState {
  final List<Task> tasks;

  AppState({this.tasks = const []});
}
