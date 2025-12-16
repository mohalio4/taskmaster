import 'package:task_master/models/task.dart';
import 'database_helper.dart';

class TaskRepository {
  final db = DatabaseHelper.instance;

  Future<void> addTask(Task task) async {
    await db.insert('tasks', task.toMap());
  }

  Future<List<Task>> getTasks() async {
    final List<Map<String, dynamic>> maps = await db.getAll('tasks');
    return maps.map((e) => Task.fromMap(e)).toList();
  }

  Future<void> updateTask(Task task) async {
    await db.update('tasks', task.toMap(), task.id);
  }

  Future<void> deleteTask(String id) async {
    await db.delete('tasks', id);
  }
}
