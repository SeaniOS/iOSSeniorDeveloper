import 'package:flutter/foundation.dart';
import '../models/task.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert';

class TaskProvider with ChangeNotifier {
  final LocalStorage storage;
  List<Task> _tasks = [];

  TaskProvider({required this.storage}) {
    _loadTasksFromStorage();
    addDefaultTasks();
  }

  List<Task> get tasks => _tasks;

  void _loadTasksFromStorage() {
    var data = storage.getItem('tasks');
    if (data != null) {
      _tasks = List<Task>.from(
        (jsonDecode(data) as List).map(
              (item) => Task.fromMap(item as Map<String, dynamic>),
        ),
      );
      notifyListeners();
    }
  }

  void _saveToStorage() {
    storage.setItem(
      'tasks',
      jsonEncode(_tasks.map((task) => task.toMap()).toList()),
    );
  }

  void addTask(Task task) {
    _tasks.add(task);
    _saveToStorage();
    notifyListeners();
  }

  void deleteTask(String id) {
    _tasks.removeWhere((element) => element.id == id);
    _saveToStorage();
    notifyListeners();
  }

  void addDefaultTasks() {
    if (_tasks.isEmpty) {
      _tasks.add(Task(id: '1', name: 'Task 1'));
      _tasks.add(Task(id: '2', name: 'Task 2'));
      _tasks.add(Task(id: '3', name: 'Task 3'));
    }
  }

  String getTaskName(String taskId) {
    Task task = _tasks.firstWhere(
          (task) => task.id == taskId,
      orElse: () => Task(id: '', name: ''),
    );
    return task.name;
  }
}