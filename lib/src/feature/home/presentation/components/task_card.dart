import 'package:flutter/material.dart';
import 'package:todo_list_app/src/core/config/theme/styles/styles.dart';
import 'package:todo_list_app/src/core/extentions/space_extention.dart';
import 'package:todo_list_app/src/core/utils/const/sizes.dart';
import 'package:todo_list_app/src/feature/home/domain/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final Function(TaskStatus) onStatusChanged;
  final VoidCallback onTap;

  const TaskCard({
    super.key,
    required this.task,
    required this.onStatusChanged,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Sizes.paddingH16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A2230),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade800.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Priority indicator
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: task.priorityColor,
                    shape: BoxShape.circle,
                  ),
                ),

                12.width,

                // Task title
                Expanded(
                  child: Text(
                    task.title,
                    style: TextStyles.f16(context).copyWith(
                      color: Colors.white,
                      fontWeight: FontStyles.fontWeightSemiBold,
                    ),
                  ),
                ),

                // Status badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: task.statusColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _getStatusText(task.status),
                    style: TextStyles.f12(
                      context,
                    ).copyWith(fontWeight: FontStyles.fontWeightMedium),
                  ),
                ),
              ],
            ),

            12.height,

            // Description
            Text(
              task.description,
              style: TextStyles.f14(
                context,
              ).copyWith(color: Colors.grey.shade400, height: 1.4),
            ),

            16.height,

            // Time and actions
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.schedule,
                    size: 14,
                    color: const Color(0xFF6366F1),
                  ),
                  6.width,
                  Text(
                    task.time,
                    style: TextStyles.f12(context).copyWith(
                      color: const Color(0xFF6366F1),
                      fontWeight: FontStyles.fontWeightMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getStatusText(TaskStatus status) {
    switch (status) {
      case TaskStatus.toDo:
        return 'To-do';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.completed:
        return 'Done';
    }
  }
}
