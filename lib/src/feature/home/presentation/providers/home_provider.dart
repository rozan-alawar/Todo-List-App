import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_app/src/feature/auth/presentation/providers/auth_providers.dart';
import 'package:todo_list_app/src/feature/home/data/data_source/task_remote_data_source.dart';
import 'package:todo_list_app/src/feature/home/domain/task.dart';
import 'package:uuid/uuid.dart';

part 'home_provider.g.dart';

@riverpod
class Home extends _$Home {
  @override
  FutureOr<List<Task>> build() async {
    final authState = ref.watch(loginStateProvider).value!;
    return authState.fold(() => <Task>[], (user) async {
      final tasks = await ref
          .read(taskRemoteDataSourceProvider)
          .getUserTasks(user.user.id);

      return tasks;
    });
  }

  TaskRemoteDataSource get taskRemoteDataSource =>
      ref.read(taskRemoteDataSourceProvider);

  void addTask({
    required String title,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required TaskStatus status,
    required String time,
    required TaskPriority priority,
  }) async {
    final loginState = ref.read(loginStateProvider).value!;

    loginState.fold(() => throw Exception('User not authenticated'), (
      user,
    ) async {
      state = const AsyncLoading();

      state = await AsyncValue.guard(() async {
        const uuid = Uuid();
        final newTask = Task(
          id: uuid.v4(),
          title: title,
          description: description,
          startDate: startDate,
          endDate: endDate,
          status: status,
          time: time,
          priority: priority,
          userId: user.user.id,
        );

        final currentTasks = state.valueOrNull ?? [];

        final createdTask = await taskRemoteDataSource.addTask(newTask);

        final updatedTasks = [...currentTasks, createdTask];
        return updatedTasks;
      });
    });
  }

  void getTasks() async {
    ref.read(loginStateProvider).value!.fold(
      () => throw Exception('User not authenticated'),
      (user) async {
        state = const AsyncLoading();
        state = await AsyncValue.guard(() async {
          return taskRemoteDataSource.getUserTasks(user.user.id);
        });
      },
    );
  }

  void updateTask({required Task updatedTask}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final currentTasks = state.valueOrNull ?? [];

      final updatedTaskFromServer = await taskRemoteDataSource.updateTask(
        updatedTask,
      );

      log("Task updated successfully");

      final updatedTasks = currentTasks
          .map(
            (task) => task.id == updatedTask.id ? updatedTaskFromServer : task,
          )
          .toList();

      return updatedTasks;
    });
  }
}

/*================== Selected Date Provider =================*/
@riverpod
class SelectedDate extends _$SelectedDate {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void selectDate(DateTime date) {
    state = date;
  }

  void selectToday() {
    state = DateTime.now();
  }

  void selectNextDay() {
    state = state.add(const Duration(days: 1));
  }

  void selectPreviousDay() {
    state = state.subtract(const Duration(days: 1));
  }
}

/*================== Task Filter Provider =================*/
enum TaskFilter { all, toDo, inProgress, completed }

@riverpod
class TaskFilterState extends _$TaskFilterState {
  @override
  TaskFilter build() {
    return TaskFilter.all;
  }

  void setFilter(TaskFilter filter) {
    state = filter;
  }
}

/*================== Filtered Tasks Provider =================*/
@riverpod
List<Task> filteredTasks(Ref ref) {
  final tasks = ref.watch(homeProvider).valueOrNull ?? [];
  final filter = ref.watch(taskFilterStateProvider);
  final selectedDate = ref.watch(selectedDateProvider);

  final tasksForSelectedDate = tasks.where((task) {
    return task.startDate.year == selectedDate.year &&
        task.startDate.month == selectedDate.month &&
        task.startDate.day == selectedDate.day;
  }).toList();

  switch (filter) {
    case TaskFilter.all:
      return tasksForSelectedDate;
    case TaskFilter.toDo:
      return tasksForSelectedDate.where((task) => task.isToDo).toList();
    case TaskFilter.inProgress:
      return tasksForSelectedDate.where((task) => task.isInProgress).toList();
    case TaskFilter.completed:
      return tasksForSelectedDate.where((task) => task.isCompleted).toList();
  }
}
