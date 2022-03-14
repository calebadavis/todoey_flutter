import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {

  Function () addTaskCallback;
  Function (String d) setTaskText;

  String newTaskDescription = '';

  AddTaskScreen({required this.addTaskCallback, required this.setTaskText});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent
              )
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText){ newTaskDescription = newText; setTaskText(newText); },
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white
                )
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                print('About to invoke callback to add task called: $newTaskDescription');
                addTaskCallback();
              },
            )
          ]
        )
      )
    );
  }

}