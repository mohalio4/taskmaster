import 'package:task_master/models/task.dart';
import 'database_helper.dart';

class TaskRepository {
  final db = DatabaseHelper.instance;

  Future<void> addTask(Task task) async {
    await db.insert('tasks', task.toMap());
  }

  Future<List<Task>> getAllTasks() async {
    final List<Map<String, dynamic>> maps = await db.getAll('tasks');
    return maps.map((e) => Task.fromMap(e)).toList();
  }

  Future<void> updateTask(Task task) async {
    await db.update('tasks', task.toMap(), task.id);
  }

  Future<void> deleteTask(String id) async {
    await db.delete('tasks', id);
  }

  // Get tasks by category
  Future<List<Task>> getTasksByCategory(String category) async {
    final allTasks = await getAllTasks();
    return allTasks.where((task) => task.category == category).toList();
  }

  // Get completed tasks
  Future<List<Task>> getCompletedTasks() async {
    final allTasks = await getAllTasks();
    return allTasks.where((task) => task.isCompleted).toList();
  }

  // Get pending tasks
  Future<List<Task>> getPendingTasks() async {
    final allTasks = await getAllTasks();
    return allTasks.where((task) => !task.isCompleted).toList();
  }

  // Get overdue tasks
  Future<List<Task>> getOverdueTasks() async {
    final allTasks = await getAllTasks();
    final now = DateTime.now();
    return allTasks.where((task) {
      if (task.dueDate == null || task.isCompleted) return false;
      return task.dueDate!.isBefore(now);
    }).toList();
  }

  // Get statistics
  Future<Map<String, int>> getStatistics() async {
    final allTasks = await getAllTasks();
    final completed = allTasks.where((task) => task.isCompleted).length;
    final pending = allTasks.where((task) => !task.isCompleted).length;
    final now = DateTime.now();
    final overdue = allTasks.where((task) {
      if (task.dueDate == null || task.isCompleted) return false;
      return task.dueDate!.isBefore(now);
    }).length;

    return {
      'total': allTasks.length,
      'completed': completed,
      'pending': pending,
      'overdue': overdue,
    };
  }
}