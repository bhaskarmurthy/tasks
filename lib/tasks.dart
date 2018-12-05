import 'package:flutter/material.dart';

class Task {
  final String title;
  final String description;
  bool checked;

  Task(this.title, this.description, this.checked);
}

class Tasks extends StatefulWidget {
  final String title;

  Tasks(this.title, {Key key}) : super(key: key);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  static final List<Task> _items = <Task>[
    Task('Simple task', null, false),
    Task('Task with description', 'Description', false),
    Task('Completed task', null, true),
    Task('Completed task with description', 'Description', true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: false,
            backgroundColor: ThemeData.light().canvasColor,
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 24, color: Colors.black),
              maxLines: 1,
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              final Task task = _items[index];
              return ListTile(
                  leading: (task.checked)
                      ? Icon(Icons.check)
                      : Icon(Icons.radio_button_unchecked),
                  title: Text(
                    task.title,
                    style: task.checked
                        ? TextStyle(
                            decoration: TextDecoration.combine(
                                [TextDecoration.lineThrough]))
                        : null,
                  ),
                  subtitle: (task.description != null)
                      ? Text(
                          task.description,
                          style: task.checked
                              ? TextStyle(
                                  decoration: TextDecoration.combine(
                                      [TextDecoration.lineThrough]))
                              : null,
                        )
                      : null,
                  onTap: () {
                    this.setState(() {
                      task.checked = !task.checked;
                    });
                  });
            }, childCount: _items.length),
          )
        ],
      ),
    );
  }
}
