import 'package:flutter/material.dart';
import 'package:tasks/models/task.dart';

class AddTaskView extends StatefulWidget {
  final Function(Task) onAddTask;

  AddTaskView({Key key, @required this.onAddTask});

  @override
  _AddTaskState createState() {
    return _AddTaskState(onAddTask: this.onAddTask);
  }
}

class _AddTaskState extends State<AddTaskView> {
  final Function(Task) onAddTask;

  String _title;

  _AddTaskState({this.onAddTask});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'New task',
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none)),
              disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none)),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none)),
            ),
            onSubmitted: (String title) {
              _onAddTask();
              Navigator.pop(context);
            },
            onChanged: (String title) {
              setState(() {
                _title = title;
              });
            },
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.add_circle,
                      color: Theme.of(context).accentColor),
                  onPressed: () {}),
              FlatButton(
                  child: Text('Save'),
                  onPressed: () {
                    this._onAddTask();
                    Navigator.pop(context);
                  },
                  textColor: Theme.of(context).accentColor)
            ],
          )
        ]));
  }

  void _onAddTask() {
    this.onAddTask(Task(_title));
  }
}
