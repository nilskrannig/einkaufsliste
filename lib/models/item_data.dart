import 'dart:collection';
import 'package:flutter/foundation.dart';

import 'package:einkaufsliste/models/item.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Milch'),
  ];

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }
}
