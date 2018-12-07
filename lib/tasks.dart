import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tasks/models/task_list_model.dart';
import 'package:tasks/views/task_list_item.dart';

class Tasks extends StatelessWidget {
  final String title;

  Tasks(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<TaskListModel>(
        builder: (context, child, model) {
      return Scaffold(
        body: ListView.separated(
          itemCount: model.tasks.length + 1,
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

            final Task task = model.tasks[index - 1];
            return TaskListItem(
                task.id, task.title, task.description, task.checked);
          },
          separatorBuilder: (BuildContext context, int index) => Divider(),
        ),
      );
    });
  }
}
