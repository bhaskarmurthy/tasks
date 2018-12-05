import 'package:flutter/material.dart';

class Task {
  final String title;
  final String description;
  final bool checked;

  Task(this.title, this.description, this.checked);
}

class Tasks extends StatelessWidget {
  static final List<Task> _items = <Task>[
    Task('Simple task', null, false),
    Task('Task with description', 'Description', false),
    Task('Completed task', null, true),
    Task('Completed task with description', 'Description', true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          final Task task = _items[index];
          return ListTile(
            leading: (task.checked)
                ? Icon(
                    Icons.check,
                    color: Colors.blue,
                  )
                : Icon(Icons.radio_button_unchecked),
            title: Text(
              task.title,
              style: task.checked
                  ? TextStyle(
                      decoration:
                          TextDecoration.combine([TextDecoration.lineThrough]))
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
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
      ),
    );
  }
}
