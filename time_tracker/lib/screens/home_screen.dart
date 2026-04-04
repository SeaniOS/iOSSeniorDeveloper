import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'models/time_entry.dart';
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
          return ListView.builder(
            itemCount: provider.entries.length,
            itemBuilder: (context, index) {
              return _buildEntryItem(context, index, provider);
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
  Widget _buildEntryItem(
    BuildContext context,
    int index,
    TimeEntryProvider provider,
  ) {
    final entry = provider.entries[index];
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
}
