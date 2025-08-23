import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_list_app/src/core/config/theme/styles/styles.dart';
import 'package:todo_list_app/src/core/extentions/space_extention.dart';
import 'package:todo_list_app/src/core/extentions/when_ex.dart';
import 'package:todo_list_app/src/core/utils/const/sizes.dart';
import 'package:todo_list_app/src/core/view/component/base/safe_scaffold.dart';
import 'package:todo_list_app/src/feature/home/domain/task.dart';
import 'package:todo_list_app/src/feature/home/presentation/components/custom_app_bar.dart';
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

    return RefreshIndicator(
      onRefresh: () async => ref.read(homeProvider.notifier).getTasks(),
      child: SafeScaffold(
        safeTop: true,
        safeBottom: true,
        body: tasks.whenSuccessInSliver(
          data: (allTasks) {
            // Filter tasks based on selected filter
            List<Task> filteredTasks = allTasks;
            switch (selectedFilterIndex.value) {
              case 1:
                filteredTasks = allTasks
                    .where((element) => element.status == TaskStatus.toDo)
                    .toList();
                break;
              case 2:
                filteredTasks = allTasks
                    .where((element) => element.status == TaskStatus.inProgress)
                    .toList();
                break;
              case 3:
                filteredTasks = allTasks
                    .where((element) => element.status == TaskStatus.completed)
                    .toList();
                break;
              default:
                filteredTasks = allTasks;
            }

            return CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                // Header Section
                SliverList(
                  delegate: SliverChildListDelegate.fixed([
                    10.height,
                    CustomAppBar(title: "Home", showBackButton: false),
                    const SizedBox(height: Sizes.paddingH24),

                    TaskFilterTabs(
                      selectedIndex: selectedFilterIndex.value,
                      onTabSelected: (index) {
                        selectedFilterIndex.value = index;
                      },
                    ),
                    const SizedBox(height: Sizes.paddingH24),
                  ]),
                ),

                // Tasks List Section
                if (filteredTasks.isEmpty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
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
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.screenPaddingH16,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        if (index >= filteredTasks.length) return null;

                        final task = filteredTasks[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: index == filteredTasks.length - 1
                                ? 100
                                : 12,
                          ),
                          child: TaskCard(
                            task: task,
                            onStatusChanged: (newStatus) {
                              ref
                                  .read(homeProvider.notifier)
                                  .updateTask(
                                    updatedTask: task.copyWith(
                                      status: newStatus,
                                    ),
                                  );
                            },
                            onTap: () {
                              // Handle task tap - could navigate to details
                            },
                          ),
                        );
                      }, childCount: filteredTasks.length),
                    ),
                  ),
              ],
            );
          },
          onRetry: () => ref.invalidate(homeProvider),
          onErrorMessage: "Error Occurred While Fetching Data!",
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.go('/home/add-task'),
          child: const Icon(Icons.add, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
