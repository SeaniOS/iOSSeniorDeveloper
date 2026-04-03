import 'package:flutter/foundation.dart';
import '../models/time_entry.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert';

class TimeEntryProvider with ChangeNotifier {
  final LocalStorage storage;
  List<TimeEntry> _entries = [];

  TimeEntryProvider({required this.storage}) {
    _loadEntriesFromStorage();
  }

  List<TimeEntry> get entries => _entries;

  void _loadEntriesFromStorage() async {
    var data = storage.getItem('Entries');
    if (data != null) {
      _entries = List<TimeEntry>.from((jsonDecode(data) as List)
          .map((item) => TimeEntry.fromMap(item as Map<String, dynamic>)));
      notifyListeners();
    }
  }

  void _saveToStorage() {
    storage.setItem('Entries',
        jsonEncode(_entries.map((entry) => entry.toMap())
            .toList()
        )
    );
  }

  void addEntry(TimeEntry entry) {
    _entries.add(entry);
    _saveToStorage();
    notifyListeners();
  }

  void deleteEntry(int id) {
    _entries.removeWhere((element) => element.id == id);
    _saveToStorage();
    notifyListeners();
  }

  void updateStudent(TimeEntry entry) {
    var index = _entries.indexWhere((element) => element.id == entry.id);
    if (index != -1) {
      _entries[index] = entry;
      _saveToStorage();
      notifyListeners();
    }
  }
}
