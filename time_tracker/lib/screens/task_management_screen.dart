import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/screens/add_screens/add_task_screen.dart';
import '../provider/task_provider.dart';

// import '../widgets/add_task_dialog.dart';
import '../models/task.dart';

class TaskManagementScreen extends StatelessWidget {
  const TaskManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Tasks')),
      body: Consumer<TaskProvider>(
        builder: (context, provider, child) {
          // Lists for managing projects would be implemented here
          return ListView.builder(
            itemCount: provider.tasks.length,
            itemBuilder: (context, index) {
              final project = provider.tasks.elementAt(index);

              return Dismissible(
                key: Key(project.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (_) => provider.deleteTask(project.id),
                child: ListTile(title: Text(project.name)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Add Task',
      ),
    );
  }
}
