import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tasks/task_list_model.dart';

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
            return Dismissible(
              key: Key(task.id),
              child: ListTile(
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
                  var toggledTask = Task(task.title,
                      description: task.description,
                      checked: !task.checked,
                      id: task.id);
                  model.updateTask(toggledTask);
                },
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                model.removeTask(task);
              },
              background: Container(color: Theme.of(context).accentColor),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(),
        ),
      );
    });
  }
}
