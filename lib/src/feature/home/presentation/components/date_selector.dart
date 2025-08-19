import 'package:flutter/material.dart';
import 'package:todo_list_app/src/core/config/theme/styles/styles.dart';
import 'package:todo_list_app/src/core/utils/const/sizes.dart';

class DateSelector extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const DateSelector({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final startDate = now.subtract(const Duration(days: 2));

    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          final date = startDate.add(Duration(days: index));
          final isSelected =
              date.day == selectedDate.day &&
              date.month == selectedDate.month &&
              date.year == selectedDate.year;
          final isToday =
              date.day == now.day &&
              date.month == now.month &&
              date.year == now.year;

          return GestureDetector(
            onTap: () => onDateSelected(date),
            child: Container(
              width: 70,
              margin: EdgeInsets.only(
                right: 12,
                left: index == 0 ? Sizes.screenPaddingH16 : 0,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF6366F1)
                    : const Color(0xFF1A2230),
                borderRadius: BorderRadius.circular(16),
                border: isToday && !isSelected
                    ? Border.all(color: const Color(0xFF6366F1), width: 1)
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _getMonthName(date.month).substring(0, 3),
                    style: TextStyles.f12(context).copyWith(
                      color: isSelected ? Colors.white : Colors.grey.shade400,
                      fontWeight: FontStyles.fontWeightMedium,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date.day.toString(),
                    style: TextStyles.f18(context).copyWith(
                      color: isSelected ? Colors.white : Colors.white,
                      fontWeight: FontStyles.fontWeightBold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _getDayName(date.weekday).substring(0, 3),
                    style: TextStyles.f12(context).copyWith(
                      color: isSelected
                          ? Colors.white.withOpacity(0.8)
                          : Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  String _getDayName(int weekday) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return days[weekday - 1];
  }
}
