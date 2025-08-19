import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_list_app/src/core/config/theme/styles/styles.dart';
import 'package:todo_list_app/src/core/extentions/space_extention.dart';
import 'package:todo_list_app/src/core/utils/const/sizes.dart';
import 'package:todo_list_app/src/core/view/component/base/buttons.dart';
import 'package:todo_list_app/src/core/view/component/base/label_text_field.dart';
import 'package:todo_list_app/src/core/view/component/base/safe_scaffold.dart';
import 'package:todo_list_app/src/core/view/component/base/text_fields.dart';
import 'package:todo_list_app/src/feature/home/domain/task.dart';
import 'package:todo_list_app/src/feature/home/presentation/components/custom_app_bar.dart';
import 'package:todo_list_app/src/feature/home/presentation/components/prioriy_selector.dart';

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

    Future<void> submitTask() async {
      if (formKey.currentState!.validate() && fieldsIsValidNotifier.value) {
        // Here you would save the task with:
        // - titleController.text
        // - descriptionController.text
        // - selectedStartDate.value!
        // - selectedEndDate.value!
        // - selectedStatus.value
        // - timeController.text
        // - selectedPriority.value

        // Clear form after submission
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

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Task added successfully!')),
        );
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
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(Sizes.radius30),
                ),
              ),
              padding: const EdgeInsets.only(
                top: Sizes.paddingH24,
                left: Sizes.screenPaddingH24,
                right: Sizes.screenPaddingH24,
                bottom: Sizes.textFieldPaddingV14,
              ),
              child: Form(
                key: formKey,
                onChanged: verifyValidation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(title: "Add New Task"),
                    20.height,

                    // Title Field
                    LabelTextField(
                      label: "Task Title",
                      child: TaskTitleTextField(
                        controller: titleController,
                        fillColor: const Color(0xff1A2230),
                      ),
                    ),

                    const SizedBox(height: Sizes.marginV16),

                    // Description Field
                    LabelTextField(
                      label: "Description",
                      child: DescriptionTextField(
                        controller: descriptionController,
                        fillColor: const Color(0xff1A2230),
                      ),
                    ),

                    const SizedBox(height: Sizes.marginV16),

                    // Time Field
                    LabelTextField(
                      label: "Time",
                      child: TimeTextField(
                        onTap: selectTime,
                        timeController: timeController,
                        selectedTime: selectedTime,
                      ),
                    ),

                    const SizedBox(height: Sizes.marginV16),

                    // Date Fields Row
                    Row(
                      children: [
                        // Start Date
                        Expanded(
                          child: LabelTextField(
                            label: "Start Date",
                            child: DateTextField(
                              onTap: selectStartDate,
                              dateController: startDateController,
                              selectedDate: selectedStartDate,
                            ),
                          ),
                        ),

                        const SizedBox(width: Sizes.marginH12),

                        // End Date
                        Expanded(
                          child: LabelTextField(
                            label: "End Date",
                            child: DateTextField(
                              onTap: selectEndDate,
                              dateController: endDateController,
                              selectedDate: selectedEndDate,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: Sizes.marginV16),

                    // Task Priority
                    LabelTextField(
                      label: "Priority",
                      child: TaskPrioritySelector(
                        selectedPriority: selectedPriority,
                      ),
                    ),
                    const SizedBox(height: Sizes.marginV32),
                    const Spacer(),
                    // Submit Button
                    HookConsumer(
                      builder: (context, ref, child) {
                        final fieldsIsValid = useValueListenable(
                          fieldsIsValidNotifier,
                        );
                        return AppButton(
                          disableButton: !fieldsIsValid,
                          onPressed: submitTask,
                          type: AppButtonType.primary,
                          child: Text(
                            "Add Task",
                            style: TextStyles.f16(context).copyWith(
                              fontWeight: FontStyles.fontWeightMedium,
                              color: fieldsIsValid ? Colors.white : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
