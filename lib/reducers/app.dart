import 'package:tasks/models/app_state.dart';
import 'package:tasks/reducers/tasks.dart';

AppState appReducer(AppState prevState, action) {
  return AppState(tasks: tasksReducer(prevState.tasks, action));
}
