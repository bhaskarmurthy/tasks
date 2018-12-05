import 'package:flutter/material.dart';
import 'package:rounded_modal/rounded_modal.dart';
import 'tasks.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'A taskwarrior powered task list',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Tasks(),
      bottomNavigationBar: BottomAppBar(
          child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                this._showMenu(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {},
            ),
          ])),
      floatingActionButton: new FloatingActionButton.extended(
        onPressed: () {
          _showAddTask(context);
        },
        icon: Icon(Icons.add),
        label: Text('Add a new task'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _showMenu(context) {
    showRoundedModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.person),
                        radius: 16,
                      ),
                      title: Text('Johnny Appleseed'),
                      onTap: () {},
                    ),
                    Divider(),
                    ListTile(
                      title: Text('My tasks',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    ListTile(
                      title: Text('@work'),
                    ),
                    Divider(),
                    ListTile(
                        leading: new Icon(Icons.add),
                        title: new Text('Create new list'),
                        onTap: () => {}),
                    Divider(),
                  ]));
        });
  }

  void _showAddTask(context) {
    showRoundedModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
              child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'New task',
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(style: BorderStyle.none)),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(style: BorderStyle.none)),
                            disabledBorder: UnderlineInputBorder(borderSide: BorderSide(style: BorderStyle.none)),
                            errorBorder: UnderlineInputBorder(borderSide: BorderSide(style: BorderStyle.none)),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(icon: Icon(Icons.add_circle, color: Colors.blue), onPressed: () {}),
                            FlatButton(child: Text('Save'), onPressed: () {}, textColor: Colors.blue)
                          ],
                        )
                      ])
              )
          );
        });
  }
}
