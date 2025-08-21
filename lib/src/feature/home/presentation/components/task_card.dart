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
    return Dismissible(
      key: Key(task.id),
      direction: DismissDirection.horizontal,
      dismissThresholds: const {
        DismissDirection.startToEnd: 0.3, // سحب لليمين
        DismissDirection.endToStart: 0.3, // سحب لليسار
      },
      background: _buildSwipeBackground(
        alignment: Alignment.centerLeft,
        color: const Color(0xFFF59E0B), // أصفر للـ In Progress
        icon: Icons.access_time_rounded,
        text: 'In Progress',
      ),
      secondaryBackground: _buildSwipeBackground(
        alignment: Alignment.centerRight,
        color: const Color(0xFF10B981), // أخضر للـ Complete
        icon: Icons.check_circle_rounded,
        text: 'Complete',
      ),
      confirmDismiss: (direction) async {
        // منع الحذف الفعلي وتغيير الحالة بدلاً من ذلك
        if (direction == DismissDirection.startToEnd) {
          // سحب لليمين = In Progress
          onStatusChanged(TaskStatus.inProgress);
        } else if (direction == DismissDirection.endToStart) {
          // سحب لليسار = Complete
          onStatusChanged(TaskStatus.completed);
        }
        return false; // منع الحذف الفعلي
      },
      child: _buildTaskCard(context),
    );
  }

  Widget _buildSwipeBackground({
    required Alignment alignment,
    required Color color,
    required IconData icon,
    required String text,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Align(
        alignment: alignment,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: alignment == Alignment.centerLeft ? 20 : 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 28),
              4.height,
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.paddingH16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2230),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade800.withOpacity(0.3),
          width: 1,
        ),
        // إضافة ظل خفيف
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
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
                    style: TextStyles.f12(context).copyWith(
                      fontWeight: FontStyles.fontWeightMedium,
                      color: Colors.white,
                    ),
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

            // Time and priority
            Row(
              children: [
                // Time badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
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

                const Spacer(),
              ],
            ),

            // إضافة مؤشر للسحب
            8.height,
          ],
        ),
      ),
    );
  }

  Color _getStatusTextColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.toDo:
        return Colors.grey.shade300;
      case TaskStatus.inProgress:
        return const Color(0xFFF59E0B);
      case TaskStatus.completed:
        return const Color(0xFF10B981);
    }
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
