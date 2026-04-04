import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/provider/project_provider.dart';
import '../provider/time_entry_provider.dart';

// import '../widgets/add_project_dialog.dart';
import 'add_screens/add_project_screen.dart';

class ProjectManagementScreen extends StatelessWidget {
  const ProjectManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Projects')),
      body: Consumer<ProjectProvider>(
        builder: (context, provider, child) {
          // Lists for managing projects would be implemented here
          return ListView.builder(
            itemCount: provider.projects.length,
            itemBuilder: (context, index) {
              final project = provider.projects.elementAt(index);
              return Text(project.name);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new project
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProjectScreen()),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Add Project',
      ),
    );
  }
}
