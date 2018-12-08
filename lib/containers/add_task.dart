import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tasks/models/app_state.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/views/add_task.dart';
import 'package:tasks/actions/tasks.dart';

class AddTaskContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (BuildContext context, _ViewModel vm) {
          return AddTaskView(
            onAddTask: vm.addTask,
          );
        });
  }
}

class _ViewModel {
  final Function(Task) addTask;

  _ViewModel({@required this.addTask});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(addTask: (task) {
      store.dispatch(AddTaskAction(task));
    });
  }
}
