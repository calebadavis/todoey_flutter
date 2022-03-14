import 'package:flutter/material.dart';
class TaskTile extends StatelessWidget {

  final String taskDescription;
  final bool checked;
  final Function (bool?) checkboxCallback;

  TaskTile({required this.taskDescription, this.checked = false, required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
            taskDescription,
          style: TextStyle(decoration: checked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: checked, onChanged: checkboxCallback,
        )
    );
  }
}

