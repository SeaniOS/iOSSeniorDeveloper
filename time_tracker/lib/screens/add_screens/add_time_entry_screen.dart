import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/models/project.dart';
import 'package:time_tracker/provider/project_provider.dart';
import '../../models/time_entry.dart';
import '../../provider/time_entry_provider.dart';

class AddTimeEntryScreen extends StatefulWidget {
  @override
  _AddTimeEntryScreenState createState() => _AddTimeEntryScreenState();
}

class _AddTimeEntryScreenState extends State<AddTimeEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  String projectId = 'Project 1';
  String taskId = 'Task 1';
  double totalTime = 0.0;
  DateTime date = DateTime.now();
  String notes = '';

  @override
  Widget build(BuildContext context) {
    final projects = Provider.of<ProjectProvider>(context).projects;
    /*
    if (!projects.isEmpty) {
      projectId = projects.first.id;
    }*/
    return Scaffold(
      appBar: AppBar(title: Text('Add Time Entry')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _buildA(),
            _buildB(),
            _buildC(),
            _buildD(),
            _buildE(),
          ],
        ),
      ),
    );
  }
}

extension _AddTimeEntryScreenStateExtension on _AddTimeEntryScreenState {
  Widget _buildA() {
    return DropdownButtonFormField<String>(
      value: projectId,
      onChanged: (String? newValue) {
        setState(() {
          projectId = newValue!;
        });
      },
      decoration: InputDecoration(labelText: 'Project'),
      items:
          <String>['Project 1', 'Project 2', 'Project 3'] // Dummy project name
              .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
              .toList(),
    );
  }

  Widget _buildB() {
    return DropdownButtonFormField<String>(
      value: taskId,
      onChanged: (String? newValue) {
        setState(() {
          taskId = newValue!;
        });
      },
      decoration: InputDecoration(labelText: 'Task'),
      items:
          <String>['Task 1', 'Task 2', 'Task 3'] // Dummy task names
              .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
              .toList(),
    );
  }

  Widget _buildC() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Total Time (hours)'),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter total time';
        }
        if (double.tryParse(value) == null) {
          return 'Please enter a valid number';
        }
        return null;
      },
      onSaved: (value) => totalTime = double.parse(value!),
    );
  }

  Widget _buildD() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Notes'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some notes';
        }
        return null;
      },
      onSaved: (value) => notes = value!,
    );
  }

  Widget _buildE() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          Provider.of<TimeEntryProvider>(context, listen: false).addEntry(
            TimeEntry(
              id: DateTime.now().toString(),
              // Simple ID generation
              projectId: projectId,
              taskId: taskId,
              totalTime: totalTime,
              date: date,
              notes: notes,
            ),
          );
          Navigator.pop(context);
        }
      },
      child: Text('Save'),
    );
  }
}
