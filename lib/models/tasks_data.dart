import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksData extends ChangeNotifier {

  String nextTaskDescription = '';

  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread')
  ];

  void setNextTaskDescription(String description) {
    nextTaskDescription = description;
  }

  void addTask() {
    _tasks.add(Task(name: nextTaskDescription));
    nextTaskDescription = '';
    notifyListeners();
  }

  int get totalCount { return _tasks.length; }

  int get taskCount {
    int ret = 0;
    for (Task t in _tasks) {
      if (!t.isDone) ++ret;
    }
    return ret;
  }

  Task getAt(int index) {
    return _tasks[index];
  }

  void deleteAt(int index) {
    if (index < 0 || index >= _tasks.length) return;
    _tasks.removeAt(index);
    notifyListeners();
  }

  void toggleDone(Task t) {
    t.toggleDone();
    notifyListeners();
  }
}