import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'task.mapper.dart';

@MappableEnum()
enum TaskStatus {
  toDo('To-do'),
  inProgress('In Progress'),
  completed('Done');

  const TaskStatus(this.displayName);
  final String displayName;
}

@MappableEnum()
enum TaskPriority { low, medium, high }

@MappableClass()
class Task with TaskMappable {
  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.time,
    required this.userId,
    required this.priority,
  });

  final String id;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final TaskStatus status;
  final String time;
  final String userId;
  final TaskPriority priority;

  //========== Helper methods ================
  String get formattedStartDate {
    return '${startDate.day}/${startDate.month}/${startDate.year}';
  }

  String get formattedEndDate {
    return '${endDate.day}/${endDate.month}/${endDate.year}';
  }

  TimeOfDay get timeOfDay {
    final parts = time.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  // Helper method to create time string from TimeOfDay
  static String timeOfDayToString(TimeOfDay timeOfDay) {
    final hour = timeOfDay.hour.toString().padLeft(2, '0');
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  Color get statusColor {
    switch (status) {
      case TaskStatus.toDo:
        return Colors.grey.shade600;
      case TaskStatus.inProgress:
        return Colors.orange;
      case TaskStatus.completed:
        return Colors.green;
    }
  }

  Color get priorityColor {
    switch (priority) {
      case TaskPriority.low:
        return Colors.green;
      case TaskPriority.medium:
        return Colors.orange;
      case TaskPriority.high:
        return Colors.red;
    }
  }

  String get priorityText {
    switch (priority) {
      case TaskPriority.low:
        return 'Low';
      case TaskPriority.medium:
        return 'Medium';
      case TaskPriority.high:
        return 'High';
    }
  }

  bool get isCompleted => status == TaskStatus.completed;
  bool get isInProgress => status == TaskStatus.inProgress;
  bool get isToDo => status == TaskStatus.toDo;

  Duration get duration => endDate.difference(startDate);
  bool get isOverdue => endDate.isBefore(DateTime.now()) && !isCompleted;
}
