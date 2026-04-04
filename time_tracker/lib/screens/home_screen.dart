import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/models/time_entry.dart';

import '../provider/time_entry_provider.dart';
import 'add_time_entry_screen.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Time Entries')),
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
  Widget _buildEntryItem(TimeEntry entry) {
    final date = DateFormat('yyyy-MM-dd HH:mm:ss').format(entry.date); // entry.date.toString()
    final title = '${entry.projectId} - ${entry.taskId} - ${entry.totalTime} hours';

    return ListTile(
      title: Text(title),
      subtitle: Text('$date - Notes: ${entry.notes}'),
      onTap: () {
        // This could open a detailed view or edit screen
      },
    );
  }

  Widget _buildEntryItemByGroup(
      BuildContext context,
      int index,
      TimeEntryProvider provider,
      ) {
    final projectMap = provider.entriesByProject;
    final projectId = projectMap.keys.elementAt(index);
    final entries = projectMap[projectId];
    final totalTime = provider.totalTimeByProject(projectId);

    return ExpansionTile(
      title: Text(projectId),
      subtitle: Text('Total: $totalTime hours'),
      children: entries?.map((entry) => _buildEntryItem(entry)).toList() ?? []
    );
  }
}
