import 'package:flutter/foundation.dart';
import '../models/project.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert';

class ProjectProvider with ChangeNotifier {
  final LocalStorage storage;
  List<Project> _projects = [];

  ProjectProvider({required this.storage}) {
    _loadProjectsFromStorage();
  }

  List<Project> get projects => _projects;

  void _loadProjectsFromStorage() async {
    var data = storage.getItem('projects');
    if (data != null) {
      _projects = List<Project>.from(
        (jsonDecode(data) as List).map(
          (item) => Project.fromMap(item as Map<String, dynamic>),
        ),
      );
      notifyListeners();
    }
  }

  void _saveToStorage() {
    storage.setItem(
      'projects',
      jsonEncode(_projects.map((projects) => projects.toMap()).toList()),
    );
  }

  void addProject(Project project) {
    _projects.add(project);
    _saveToStorage();
    notifyListeners();
  }

  void deleteProject(String id) {
    _projects.removeWhere((element) => element.id == id);
    _saveToStorage();
    notifyListeners();
  }
}
