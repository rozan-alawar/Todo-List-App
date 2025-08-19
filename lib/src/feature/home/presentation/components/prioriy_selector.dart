import 'package:flutter/material.dart';
import 'package:todo_list_app/src/feature/home/domain/task.dart';

class TaskPrioritySelector extends StatelessWidget {
  const TaskPrioritySelector({required this.selectedPriority, super.key});

  final ValueNotifier<TaskPriority> selectedPriority;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xff1A2230),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: TaskPriority.values.map((priority) {
          return Expanded(
            child: GestureDetector(
              onTap: () => selectedPriority.value = priority,
              child: ValueListenableBuilder<TaskPriority>(
                valueListenable: selectedPriority,
                builder: (context, selected, child) {
                  final isSelected = selected == priority;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? _getPriorityColor(priority)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      _getPriorityText(priority),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey,
                        fontSize: 12,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _getPriorityText(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.low:
        return 'Low';
      case TaskPriority.medium:
        return 'Medium';
      case TaskPriority.high:
        return 'High';
    }
  }

  Color _getPriorityColor(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.low:
        return Colors.green;
      case TaskPriority.medium:
        return Colors.orange;
      case TaskPriority.high:
        return Colors.red;
    }
  }
}
