import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_list_app/src/core/config/theme/styles/styles.dart';
import 'package:todo_list_app/src/core/extentions/space_extention.dart';
import 'package:todo_list_app/src/core/utils/const/sizes.dart';
import 'package:todo_list_app/src/core/view/component/base/safe_scaffold.dart';
import 'package:todo_list_app/src/feature/home/domain/task.dart';
import 'package:todo_list_app/src/feature/home/presentation/components/custom_app_bar.dart';
import 'package:todo_list_app/src/feature/home/presentation/components/date_selector.dart';
import 'package:todo_list_app/src/feature/home/presentation/components/task_card.dart';
import 'package:todo_list_app/src/feature/home/presentation/components/task_filter_tabs.dart';
import 'package:todo_list_app/src/feature/home/presentation/providers/home_provider.dart';

class HomeScreenCompact extends HookConsumerWidget {
  const HomeScreenCompact({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = useState<DateTime>(DateTime.now());
    final selectedFilterIndex = useState<int>(0);

    final tasks = ref.watch(homeProvider);
    final sectionSpace = SizedBox(height: Sizes.paddingH24);

    List<Task> getFilteredTasks() {
      switch (selectedFilterIndex.value) {
        case 0:
          return tasks;
        case 1:
          return tasks.where((task) => task.status == TaskStatus.toDo).toList();
        case 2:
          return tasks
              .where((task) => task.status == TaskStatus.inProgress)
              .toList();
        case 3:
          return tasks
              .where((task) => task.status == TaskStatus.completed)
              .toList();
        default:
          return tasks;
      }
    }

    return SafeScaffold(
      safeTop: true,
      safeBottom: true,
      body: Column(
        children: [
          10.height,
          CustomAppBar(title: "Home", showBackButton: false),
          sectionSpace,
          DateSelector(
            selectedDate: selectedDate.value,
            onDateSelected: (date) {
              selectedDate.value = date;
            },
          ),
          sectionSpace,
          TaskFilterTabs(
            selectedIndex: selectedFilterIndex.value,
            onTabSelected: (index) {
              selectedFilterIndex.value = index;
            },
          ),
          sectionSpace,
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.screenPaddingH16,
              ),
              child: getFilteredTasks().isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.task_alt,
                            size: 64,
                            color: Colors.grey.shade400,
                          ),
                          16.height,
                          Text(
                            'No tasks found',
                            style: TextStyles.f18(context).copyWith(
                              color: Colors.grey.shade600,
                              fontWeight: FontStyles.fontWeightMedium,
                            ),
                          ),
                          8.height,
                          Text(
                            'Add a new task to get started',
                            style: TextStyles.f14(
                              context,
                            ).copyWith(color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.only(top: 8, bottom: 100),
                      itemCount: getFilteredTasks().length,
                      separatorBuilder: (context, index) => 12.height,
                      itemBuilder: (context, index) {
                        final task = getFilteredTasks()[index];
                        return TaskCard(
                          task: task,
                          onStatusChanged: (newStatus) {},
                          onTap: () {},
                        );
                      },
                    ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/home/add-task'),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
