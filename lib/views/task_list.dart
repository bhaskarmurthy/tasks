import 'package:flutter/material.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/views/task_list_item.dart';

class TaskListView extends StatelessWidget {
  final String title;
  final List<Task> tasks;
  final Function(Task) onRemoveTask;

  TaskListView(
      {Key key,
      @required this.title,
      @required this.tasks,
      @required this.onRemoveTask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: tasks.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Container(
              child: Text(
                this.title,
                style: Theme.of(context).textTheme.headline,
                maxLines: 1,
              ),
              padding: EdgeInsets.all(16),
            );
          }

          final Task task = tasks[index - 1];
          return TaskListItemView(
              task.id, task.title, task.description, task.checked);
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
      ),
    );
  }
}
