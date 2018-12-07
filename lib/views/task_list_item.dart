import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget {

  final String id;
  final String title;
  final String description;
  final bool checked;

  TaskListItem(this.id, this.title, this.description, this.checked);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(id),
        child: ListTile(
          leading: (checked)
              ? Icon(Icons.check)
              : Icon(Icons.radio_button_unchecked),
          title: Text(
            title,
            style: checked
                ? TextStyle(
                decoration: TextDecoration.combine(
                    [TextDecoration.lineThrough]))
                : null,
          ),
          subtitle: (description != null)
              ? Text(
            description,
            style: checked
                ? TextStyle(
                decoration: TextDecoration.combine(
                    [TextDecoration.lineThrough]))
                : null,
          )
              : null,
          onTap: () => {},
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) => {},
        background: Container(color: Theme.of(context).accentColor),
    );
  }
}
