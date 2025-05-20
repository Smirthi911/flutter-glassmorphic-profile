import 'package:flutter/material.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final List<Task> tasks = [
    Task(title: 'Design wireframes', description: 'Create UI for login and profile'),
    Task(title: 'Setup GitHub repo'),
    Task(title: 'Write README', description: 'Add basic project structure info'),
    Task(title: 'Test on multiple devices'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: Text(
                task.title,
                style: TextStyle(
                  decoration: task.isDone ? TextDecoration.lineThrough : null,
                ),
              ),
              subtitle: task.description != null ? Text(task.description!) : null,
              trailing: Checkbox(
                value: task.isDone,
                onChanged: (val) {
                  setState(() {
                    task.isDone = val ?? false;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class Task {
  final String title;
  final String? description;
  bool isDone;

  Task({required this.title, this.description, this.isDone = false});
}
