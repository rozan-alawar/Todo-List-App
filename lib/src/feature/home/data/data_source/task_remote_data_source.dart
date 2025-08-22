import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_app/src/core/services/firebase_config/firebase_config.dart';
import 'package:todo_list_app/src/feature/home/domain/task.dart';

part 'task_remote_data_source.g.dart';

@Riverpod(keepAlive: true)
TaskRemoteDataSource taskRemoteDataSource(Ref ref) {
  return TaskRemoteDataSource();
}

@immutable
class TaskRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const String _tasksCollection = 'tasks';

  Task _taskFromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    // Convert Timestamps to DateTime
    final processedData = <String, dynamic>{};
    for (final entry in data.entries) {
      if (entry.value is Timestamp) {
        processedData[entry.key] = (entry.value as Timestamp).toDate();
      } else {
        processedData[entry.key] = entry.value;
      }
    }

    return TaskMapper.fromJson({...processedData, 'id': doc.id});
  }

  // =====================================================
  //                    Add Task
  // =====================================================
  Future<Task> addTask(Task task) async {
    try {
      final taskData = task.toJson();

      taskData.remove('id');

      final docRef = await _firestore
          .collection(_tasksCollection)
          .add(taskData);

      return task.copyWith(id: docRef.id);
    } catch (e) {
      throw UnknownFailure('Failed to add task: ${e.toString()}');
    }
  }

  // =====================================================
  //                    Get User Tasks
  // =====================================================
  Future<List<Task>> getUserTasks(String userId) async {
    try {
      final querySnapshot = await _firestore
          .collection(_tasksCollection)
          .where('userId', isEqualTo: userId)
          .get();

      return querySnapshot.docs.map(_taskFromDocument).toList();
    } catch (e) {
      throw UnknownFailure('Failed to get tasks: ${e.toString()}');
    }
  }
}
