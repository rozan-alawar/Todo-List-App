import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_list_app/src/core/services/riverpod/widget_ref_extension.dart';
import 'package:todo_list_app/src/core/view/component/base/safe_scaffold.dart';
import 'package:todo_list_app/src/feature/home/domain/task.dart';
import 'package:todo_list_app/src/feature/home/presentation/components/add_task_form.dart';
import 'package:todo_list_app/src/feature/home/presentation/providers/home_provider.dart';

class AddTaskScreenCompact extends HookConsumerWidget {
  const AddTaskScreenCompact({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final fieldsIsValidNotifier = useValueNotifier(false);

    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final timeController = useTextEditingController();
    final startDateController = useTextEditingController();
    final endDateController = useTextEditingController();

    final selectedTime = useState<TimeOfDay?>(null);
    final selectedStartDate = useState<DateTime?>(null);
    final selectedEndDate = useState<DateTime?>(null);
    final selectedStatus = useState<TaskStatus>(TaskStatus.toDo);
    final selectedPriority = useState<TaskPriority>(TaskPriority.medium);

    void verifyValidation() {
      final isTitleValid = titleController.text.trim().isNotEmpty;
      final isDescriptionValid = descriptionController.text.trim().isNotEmpty;
      final isTimeValid = selectedTime.value != null;
      final isStartDateValid = selectedStartDate.value != null;
      final isEndDateValid = selectedEndDate.value != null;

      fieldsIsValidNotifier.value =
          isTitleValid &&
          isDescriptionValid &&
          isTimeValid &&
          isStartDateValid &&
          isEndDateValid;
    }

    Future<void> selectTime() async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: selectedTime.value ?? TimeOfDay.now(),
      );
      if (picked != null) {
        selectedTime.value = picked;
        timeController.text = picked.format(context);
        verifyValidation();
      }
    }

    Future<void> selectStartDate() async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedStartDate.value ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030),
      );
      if (picked != null) {
        selectedStartDate.value = picked;
        startDateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
        verifyValidation();
      }
    }

    Future<void> selectEndDate() async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate:
            selectedEndDate.value ??
            (selectedStartDate.value?.add(const Duration(days: 1)) ??
                DateTime.now()),
        firstDate: selectedStartDate.value ?? DateTime.now(),
        lastDate: DateTime(2030),
      );
      if (picked != null) {
        selectedEndDate.value = picked;
        endDateController.text = "${picked.day}/${picked.month}/${picked.year}";
        verifyValidation();
      }
    }

    ref.easyListen(
      homeProvider,
      handleLoading: true,
      whenData: (tasks) {
        context.pop();
      },
      whenError: (error) {
        return null;
      },
    );

    Future<void> submitTask() async {
      if (formKey.currentState!.validate() && fieldsIsValidNotifier.value) {
        ref
            .read(homeProvider.notifier)
            .addTask(
              title: titleController.text.trim(),
              description: descriptionController.text.trim(),
              startDate: selectedStartDate.value!,
              endDate: selectedEndDate.value!,
              status: selectedStatus.value,
              time: Task.timeOfDayToString(selectedTime.value!),
              priority: selectedPriority.value,
            );

        titleController.clear();
        descriptionController.clear();
        timeController.clear();
        startDateController.clear();
        endDateController.clear();
        selectedTime.value = null;
        selectedStartDate.value = null;
        selectedEndDate.value = null;
        selectedStatus.value = TaskStatus.toDo;
        selectedPriority.value = TaskPriority.medium;
        fieldsIsValidNotifier.value = false;

        context.pop();

        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('Task added successfully!')),
        // );
      }
    }

    return SafeScaffold(
      safeTop: true,
      safeBottom: true,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: AddTaskForm(
              formKey: formKey,
              titleController: titleController,
              descriptionController: descriptionController,
              timeController: timeController,
              selectedTime: selectedTime,
              startDateController: startDateController,
              selectedStartDate: selectedStartDate,
              endDateController: endDateController,
              selectedEndDate: selectedEndDate,
              selectedPriority: selectedPriority,
              fieldsIsValidNotifier: fieldsIsValidNotifier,
              verifyValidation: verifyValidation,
              selectTime: selectTime,
              selectStartDate: selectStartDate,
              selectEndDate: selectEndDate,
              submitTask: submitTask,
            ),
          ),
        ],
      ),
    );
  }
}
