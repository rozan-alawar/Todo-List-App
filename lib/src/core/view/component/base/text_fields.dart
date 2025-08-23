import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list_app/src/core/gen/app_assets.dart';
import 'package:todo_list_app/src/core/utils/const/sizes.dart';
import 'package:todo_list_app/src/core/utils/const/validator_fields.dart';
import 'package:todo_list_app/src/core/view/component/base/label_text_field.dart';

import '../../../config/theme/app_color/extensions_color.dart';
import '../../../config/theme/styles/styles.dart';
import 'image.dart';

class FullNameTextFelids extends StatelessWidget {
  const FullNameTextFelids({
    required this.firstNameCtr,
    required this.lastNameCtr,
    this.fillColor,
    super.key,
  });
  final TextEditingController firstNameCtr;
  final TextEditingController lastNameCtr;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: LabelTextField(
            label: "First Name",
            child: TextFormField(
              controller: firstNameCtr,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (name) {
                final result = ValidatorFields.isValidName(context)?.call(name);
                return result;
              },
              decoration: InputDecoration(
                hintText: "Enter First Name",
                fillColor: fillColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: Sizes.paddingH12),
        Expanded(
          child: LabelTextField(
            label: "Last Name",
            child: TextFormField(
              controller: lastNameCtr,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (name) =>
                  ValidatorFields.isValidName(context)?.call(name),
              decoration: InputDecoration(
                hintText: "Enter Last",
                fillColor: fillColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    required this.controller,
    super.key,
    this.autoFocus = false,
    this.fillColor,
    this.enabled,
    this.suffixIcon,
    this.filled = true,
  });

  final TextEditingController controller;
  final bool autoFocus;
  final Color? fillColor;
  final bool? enabled;
  final Widget? suffixIcon;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      controller: controller,
      enabled: enabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (email) =>
          ValidatorFields.isValidEmail(context)?.call(email?.trim()),
      style: !filled
          ? TextStyles.f16(
              context,
            ).copyWith(color: appSwitcherColors(context).neutralColors.shade600)
          : null,
      decoration: InputDecoration(
        hintText: "Enter Email",
        filled: filled,
        enabledBorder: !filled ? const OutlineInputBorder() : null,
        suffixIcon: suffixIcon,
        fillColor: fillColor,
      ),
    );
  }
}

class PasswordTextField extends HookWidget {
  const PasswordTextField({
    required this.controller,
    this.fillColor,
    super.key,
  });

  final TextEditingController controller;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final isVisible = useState(false);

    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (password) =>
          ValidatorFields.isValidPassword(context)?.call(password),
      obscureText: !isVisible.value,
      decoration: InputDecoration(
        hintText: "Enter Password",
        fillColor: fillColor,
        suffixIcon: IconButton(
          onPressed: () => isVisible.value = !isVisible.value,
          icon: AppAssetsSvg(
            isVisible.value
                ? AppAssets.ASSETS_ICONS_EYE_ON_SVG
                : AppAssets.ASSETS_ICONS_EYE_OFF_SVG,
          ),
        ),
      ),
    );
  }
}

class ConfirmPasswordTextField extends HookWidget {
  const ConfirmPasswordTextField({
    required this.controller,
    required this.passwordToConfirm,
    super.key,
  });

  final TextEditingController controller;
  final TextEditingController passwordToConfirm;

  @override
  Widget build(BuildContext context) {
    final isVisible = useState(false);
    final passwordToConfirmNotifier = useListenable(passwordToConfirm);
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (password) => ValidatorFields.isValidPassword(
        context,
        passwordToConfirmNotifier.text,
      )?.call(password),
      obscureText: !isVisible.value,
      decoration: InputDecoration(
        hintText: "Confirm Password",
        suffixIcon: IconButton(
          onPressed: () => isVisible.value = !isVisible.value,
          icon: AppAssetsSvg(
            isVisible.value
                ? AppAssets.ASSETS_ICONS_EYE_ON_SVG
                : AppAssets.ASSETS_ICONS_EYE_OFF_SVG,
          ),
        ),
      ),
    );
  }
}

class SearchTextField extends HookWidget {
  const SearchTextField({
    this.controller,
    super.key,
    this.fillColor,
    this.border,
    this.hintText,
    this.style,
    this.onChanged,
  });

  final TextEditingController? controller;
  final Color? fillColor;
  final InputBorder? border;
  final String? hintText;
  final TextStyle? style;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final isFocus = useListenableSelector(focusNode, () => focusNode.hasFocus);
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: focusNode,
      style: style,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: border,
        fillColor: fillColor,
        hintText: hintText,
        suffixIcon: controller == null || controller!.text.isEmpty
            ? null
            : IconButton(
                onPressed: controller!.clear,
                icon: const Icon(CupertinoIcons.xmark_circle_fill, size: 20),
              ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 20,
          minHeight: 20,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            right: Sizes.paddingH16,
            left: Sizes.paddingH8,
          ),
          child: AppAssetsSvg(
            AppAssets.ASSETS_ICONS_SEARCH_SVG,
            color: isFocus
                ? appSwitcherColors(context).primaryColor
                : appSwitcherColors(context).neutralColors.shade80,
          ),
        ),
      ),
    );
  }
}

class TaskTitleTextField extends StatelessWidget {
  const TaskTitleTextField({
    required this.controller,
    super.key,
    this.autoFocus = false,
    this.fillColor,
    this.enabled,
    this.suffixIcon,
    this.filled = true,
  });

  final TextEditingController controller;
  final bool autoFocus;
  final Color? fillColor;
  final bool? enabled;
  final Widget? suffixIcon;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      controller: controller,
      enabled: enabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (task) =>
          ValidatorFields.isValidTaskTitle(context)?.call(task?.trim()),
      style: !filled
          ? TextStyles.f16(
              context,
            ).copyWith(color: appSwitcherColors(context).neutralColors.shade600)
          : null,
      decoration: InputDecoration(
        hintText: "Enter task title",
        filled: filled,
        enabledBorder: !filled ? const OutlineInputBorder() : null,
        suffixIcon: suffixIcon,
        fillColor: fillColor,
      ),
    );
  }
}

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({
    required this.controller,
    super.key,
    this.autoFocus = false,
    this.fillColor,
    this.enabled,
    this.suffixIcon,
    this.filled = true,
  });

  final TextEditingController controller;
  final bool autoFocus;
  final Color? fillColor;
  final bool? enabled;
  final Widget? suffixIcon;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      controller: controller,
      enabled: enabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (email) =>
          ValidatorFields.isValidDescription(context)?.call(email?.trim()),
      style: !filled
          ? TextStyles.f16(
              context,
            ).copyWith(color: appSwitcherColors(context).neutralColors.shade600)
          : null,
      decoration: InputDecoration(
        hintText: "Enter description",
        filled: filled,
        enabledBorder: !filled ? const OutlineInputBorder() : null,
        suffixIcon: suffixIcon,
        fillColor: fillColor,
      ),
    );
  }
}

class DateTextField extends StatelessWidget {
  const DateTextField({
    super.key,
    required this.dateController,
    required this.selectedDate,
    this.onTap,
  });

  final TextEditingController dateController;
  final ValueNotifier<DateTime?> selectedDate;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dateController,
      readOnly: true,
      onTap: onTap,
      validator: (value) {
        if (selectedDate.value == null) {
          return 'Date is required';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Select date",
        prefixIcon: const Icon(Icons.calendar_today),
        suffixIcon: const Icon(Icons.arrow_drop_down),
      ),
    );
  }
}

class TimeTextField extends StatelessWidget {
  const TimeTextField({
    required this.onTap,
    required this.timeController,
    required this.selectedTime,
    super.key,
  });

  final VoidCallback onTap;
  final TextEditingController timeController;
  final ValueNotifier<TimeOfDay?> selectedTime;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: timeController,
      readOnly: true,
      onTap: onTap,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (selectedTime.value == null) {
          return 'Time is required';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Select time",
        fillColor: const Color(0xff1A2230),
        suffixIcon: const Icon(Icons.access_time),
      ),
    );
  }
}
