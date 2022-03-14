import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/task_tile.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatefulWidget {

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  List<Task> tasksList = [];
  String newTaskDescription = '';

  void setNewTaskDescription(String d) {
    print('New task will be called: $d');
    newTaskDescription = d;
  }

  void addTaskToList(String taskDescription) {
    setState(() {
      print('Adding task: $newTaskDescription');
      tasksList.add(Task(name: newTaskDescription));
    });
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(context: context, builder: (BuildContext context) => AddTaskScreen(
              addTaskCallback: addTaskToList,
              setTaskText: setNewTaskDescription
          ));
        }
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Container(
            padding: EdgeInsets.only(
              top: 60,
              left: 30,
              right: 30,
              bottom: 30
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 30
                  )
                ),
                SizedBox(
                  height: 10
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700
                  )
                ),
                Text(
                  '${tasksList.length} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  )
               )
              ]
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
              ),
              child: TasksList(
                tasks: tasksList
              )
            )
          )
        ]
      )
    );
  }
}






