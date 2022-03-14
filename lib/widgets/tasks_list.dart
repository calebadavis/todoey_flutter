import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksList extends StatefulWidget{

  List<Task> tasks;

  TasksList({required this.tasks});
  //final List<TaskTile> tiles;

  //TasksList({required this.tiles});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    /*
    List<TaskTile> tiles = [];
    for (Task t in tasks) tiles.add(TaskTile(taskDescription: t.name, checked: t.isDone));
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        children: tiles
    );
    */

    return ListView.builder(
      itemBuilder: (context, index) {
        Task t = widget.tasks[index];
        return TaskTile(
          taskDescription: t.name,
          checked: t.isDone,
          checkboxCallback: (bool? checkboxState) {
            setState(() {
              t.toggleDone();
            });
          }
        );
      },
      itemCount: widget.tasks.length
    );
  }
}