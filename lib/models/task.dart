import 'package:uuid/uuid.dart';

class Task {
  final String id;
  final String title;
  final String? description;
  final String category;
  final String priority; // high • medium • low
  final DateTime? dueDate;
  final String status; // pending • in_progress • completed
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  Task({
    String? id,
    required this.title,
    this.description,
    required this.category,
    required this.priority,
    this.dueDate,
    required this.status,
    this.isCompleted = false,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  // ---------------------------------------
  // ✅ Convert from Database (Map → Task)
  // ---------------------------------------
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
      priority: map['priority'],
      dueDate: map['due_date'] != null ? DateTime.parse(map['due_date']) : null,
      status: map['status'],
      isCompleted: map['is_completed'] == 1,
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  // ---------------------------------------
  // ✅ Convert to Database (Task → Map)
  // ---------------------------------------
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'priority': priority,
      'due_date': dueDate?.toIso8601String(),
      'status': status,
      'is_completed': isCompleted ? 1 : 0,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  // ---------------------------------------
  // ✅ Copy Task (useful for editing)
  // ---------------------------------------
  Task copyWith({
    String? title,
    String? description,
    String? category,
    String? priority,
    DateTime? dueDate,
    String? status,
    bool? isCompleted,
    DateTime? updatedAt,
  }) {
    return Task(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      priority: priority ?? this.priority,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}
