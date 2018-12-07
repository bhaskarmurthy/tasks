import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tasks/models/app_state.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/views/task_list.dart';
import 'package:tasks/actions/tasks.dart';

class TaskListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (BuildContext context, _ViewModel vm) {
          return TaskListView(
            title: vm.title,
            tasks: vm.tasks,
            onRemoveTask: vm.deleteTask,
          );
        });
  }
}

class _ViewModel {
  final String title;
  final List<Task> tasks;
  final Function(Task) deleteTask;

  _ViewModel(
      {@required this.title, @required this.tasks, @required this.deleteTask});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        title: 'Hello, world',
        tasks: store.state.tasks,
        deleteTask: (task) {
          store.dispatch(DeleteTaskAction(task));
        });
  }
}
