import 'package:flutter/material.dart';
import '../data/task_repository.dart';
import '../models/task.dart';
import '../widgets/glass_card.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final repo = TaskRepository();
  List<Task> tasks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {
    setState(() => isLoading = true);
    tasks = await repo.getTasks(); // Fixed: was getAllTasks()
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Tasks")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : tasks.isEmpty
          ? const Center(child: Text("No tasks found"))
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (_, i) {
          final t = tasks[i];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GlassCard(
              child: ListTile(
                title: Text(t.title),
                subtitle: Text(t.category),
                trailing: Icon(
                  t.isCompleted
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}