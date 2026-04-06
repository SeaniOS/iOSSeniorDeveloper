import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/models/time_entry.dart';
import 'package:time_tracker/provider/project_provider.dart';
import 'package:time_tracker/provider/task_provider.dart';

import '../provider/time_entry_provider.dart';
import 'add_screens/add_time_entry_screen.dart';
import 'package:intl/intl.dart';

import 'project_management_screen.dart';
import 'task_management_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Entries'),
        actions: [
          TextButton.icon(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProjectManagementScreen()),
            ),
            label: Text('Projects', style: TextStyle(color: Colors.black)),
          ),
          TextButton.icon(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => TaskManagementScreen()),
            ),
            label: Text('Tasks', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: Consumer<TimeEntryProvider>(
        builder: (context, provider, child) {
          final projectMap = provider.entriesByProject;

          return ListView.builder(
            itemCount: projectMap.keys.length, // provider.entries.length
            itemBuilder: (context, index) {
              return _buildEntryItemByGroup(context, index, provider);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the screen to add a new time entry
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTimeEntryScreen()),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Add Time Entry',
      ),
    );
  }
}

extension HomeScreenExtension on HomeScreen {
  Widget _buildEntryItemByGroup(
    BuildContext context,
    int index,
    TimeEntryProvider provider,
  ) {
    final projectMap = provider.entriesByProject;
    final projectId = projectMap.keys.elementAt(index);

    final projectName = Provider.of<ProjectProvider>(context).getProjectName(projectId);

    final entries = projectMap[projectId];
    final totalTime = provider.totalTimeByProject(projectId);

    return ExpansionTile(
      title: Text(projectName),
      subtitle: Text('Total: $totalTime hours'),
      children:
          entries?.map((entry) {
            // each entry
            final taskName = Provider.of<TaskProvider>(context).getTaskName(entry.taskId);
            return _buildEntryItem(entry, provider, projectName, taskName);
          }).toList() ??
          [],
    );
  }

  Widget _buildEntryItem(TimeEntry entry, TimeEntryProvider provider, String projectName, String taskName) {
    final date = DateFormat(
      'yyyy-MM-dd HH:mm:ss',
    ).format(entry.date); // entry.date.toString()
    final title =
        '$projectName - $taskName - ${entry.totalTime} hours';

    return Dismissible(
      key: Key(entry.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 16),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => provider.deleteEntry(entry.id),
      child: ListTile(
        title: Text(title),
        subtitle: Text('$date - Notes: ${entry.notes}'),
        onTap: () {
          // This could open a detailed view or edit screen
        },
      ),
    );
  }
}
