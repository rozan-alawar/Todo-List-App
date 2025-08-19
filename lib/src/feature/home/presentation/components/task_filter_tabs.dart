import 'package:flutter/material.dart';
import 'package:todo_list_app/src/core/config/theme/styles/styles.dart';
import 'package:todo_list_app/src/core/utils/const/sizes.dart';

class TaskFilterTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const TaskFilterTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TaskFilterTab(
        title: 'All',
        color: const Color(0xFF6366F1),
        isSelected: selectedIndex == 0,
      ),
      TaskFilterTab(
        title: 'To do',
        color: Colors.grey.shade600,
        isSelected: selectedIndex == 1,
      ),
      TaskFilterTab(
        title: 'In Progress',
        color: const Color(0xFF8B5CF6),
        isSelected: selectedIndex == 2,
      ),
      TaskFilterTab(
        title: 'Completed',
        color: const Color(0xFF10B981),
        isSelected: selectedIndex == 3,
      ),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;

          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Container(
              margin: EdgeInsets.only(
                right: index < tabs.length ? 12 : 0,
                left: index == 0 ? Sizes.screenPaddingH16 : 0,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: tab.isSelected ? tab.color : const Color(0xFF1A2230),
                borderRadius: BorderRadius.circular(25),
                border: tab.isSelected
                    ? null
                    : Border.all(
                        color: Colors.grey.shade700.withOpacity(0.3),
                        width: 1,
                      ),
              ),
              child: Text(
                tab.title,
                style: TextStyles.f14(context).copyWith(
                  color: tab.isSelected ? Colors.white : Colors.grey.shade400,
                  fontWeight: tab.isSelected
                      ? FontStyles.fontWeightMedium
                      : FontStyles.fontWeightNormal,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class TaskFilterTab {
  final String title;
  final Color color;
  final bool isSelected;

  TaskFilterTab({
    required this.title,
    required this.color,
    required this.isSelected,
  });
}
