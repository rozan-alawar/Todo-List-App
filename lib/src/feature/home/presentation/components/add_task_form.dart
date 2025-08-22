import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_list_app/src/core/config/theme/styles/styles.dart';
import 'package:todo_list_app/src/core/extentions/space_extention.dart';
import 'package:todo_list_app/src/core/utils/const/sizes.dart';
import 'package:todo_list_app/src/core/view/component/base/buttons.dart';
import 'package:todo_list_app/src/core/view/component/base/label_text_field.dart';
import 'package:todo_list_app/src/core/view/component/base/text_fields.dart';
import 'package:todo_list_app/src/feature/home/domain/task.dart';
import 'package:todo_list_app/src/feature/home/presentation/components/custom_app_bar.dart';
import 'package:todo_list_app/src/feature/home/presentation/components/prioriy_selector.dart';

class AddTaskForm extends StatelessWidget {
  const AddTaskForm({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.descriptionController,
    required this.timeController,
    required this.selectedTime,
    required this.startDateController,
    required this.selectedStartDate,
    required this.endDateController,
    required this.selectedEndDate,
    required this.selectedPriority,
    required this.fieldsIsValidNotifier,
    required this.verifyValidation,
    required this.selectTime,
    required this.selectStartDate,
    required this.selectEndDate,
    required this.submitTask,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController timeController;
  final ValueNotifier<TimeOfDay?> selectedTime;
  final TextEditingController startDateController;
  final ValueNotifier<DateTime?> selectedStartDate;
  final TextEditingController endDateController;
  final ValueNotifier<DateTime?> selectedEndDate;
  final ValueNotifier<TaskPriority> selectedPriority;
  final ValueNotifier<bool> fieldsIsValidNotifier;
  final void Function() verifyValidation;
  final void Function() selectTime;
  final void Function() selectStartDate;
  final void Function() selectEndDate;
  final void Function() submitTask;
  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: TaskPrioritySelector(selectedPriority: selectedPriority),
            ),
            const SizedBox(height: Sizes.marginV32),
            const Spacer(),
            // Submit Button
            HookConsumer(
              builder: (context, ref, child) {
                final fieldsIsValid = useValueListenable(fieldsIsValidNotifier);
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
    );
  }
}
