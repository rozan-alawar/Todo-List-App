import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_app/src/feature/home/domain/task.dart';

part 'home_provider.g.dart';

@riverpod
class Home extends _$Home {
  final tasks = [
    Task(
      id: '1',
      title: 'Market Research',
      description: 'Grocery shopping app design',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 2)),
      status: TaskStatus.completed,
      time: '10:00 AM',
      priority: TaskPriority.high,
    ),
    Task(
      id: '2',
      title: 'Competitive Analysis',
      description: 'Grocery shopping app design',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 3)),
      status: TaskStatus.inProgress,
      time: '12:00 PM',
      priority: TaskPriority.medium,
    ),
    Task(
      id: '3',
      title: 'Create Low-fidelity Wireframe',
      description: 'Uber Eats redesign challenge',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 1)),
      status: TaskStatus.toDo,
      time: '07:00 PM',
      priority: TaskPriority.low,
    ),
    Task(
      id: '4',
      title: 'How to pitch a Design Sprint',
      description: 'About design sprint',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 4)),
      status: TaskStatus.toDo,
      time: '09:00 PM',
      priority: TaskPriority.medium,
    ),
  ];

  @override
  List<Task> build() {
    return tasks;
  }

  void addTask({
    required String taskTitle,
    required String taskDescription,
    required String startDate,
  }) {}
}
