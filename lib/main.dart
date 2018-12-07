import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tasks/models/app_state.dart';
import 'package:tasks/reducers/app.dart';
import 'package:tasks/views/home.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  final store =
      Store<AppState>(appReducer, initialState: AppState(tasks: const []));

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'A taskwarrior powered task list',
        theme: new ThemeData(
          primarySwatch: Colors.red,
        ),
        home: new HomeView(),
      ),
    );
  }
}
