import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_list_app/src/core/config/theme/styles/styles.dart';
import 'package:todo_list_app/src/core/utils/const/sizes.dart';
import 'package:todo_list_app/src/core/view/component/base/buttons.dart';
import 'package:todo_list_app/src/core/view/component/base/label_text_field.dart';
import 'package:todo_list_app/src/core/view/component/base/text_fields.dart';
import 'package:todo_list_app/src/feature/auth/presentation/providers/auth_providers.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.sectionSpace,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.fieldsIsValidNotifier,
    this.verifyValidation,
    this.submitToRegister,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final SizedBox sectionSpace;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final ValueNotifier<bool> fieldsIsValidNotifier;
  final void Function()? verifyValidation;
  final void Function()? submitToRegister;
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
            FullNameTextFelids(
              firstNameCtr: firstNameController,
              lastNameCtr: lastNameController,
            ),
            sectionSpace,
            LabelTextField(
              label: "Email",
              child: EmailTextField(
                controller: emailController,
                fillColor: Color(0xff1A2230),
              ),
            ),
            sectionSpace,

            LabelTextField(
              label: "Password",
              child: PasswordTextField(
                controller: passwordController,
                fillColor: Color(0xff1A2230),
              ),
            ),
            sectionSpace,
            LabelTextField(
              label: "Confirm Password",
              child: ConfirmPasswordTextField(
                controller: confirmPasswordController,
                passwordToConfirm: passwordController,
              ),
            ),
            SizedBox(height: Sizes.marginV64),

            HookConsumer(
              builder: (context, ref, child) {
                final fieldsIsValid = useValueListenable(fieldsIsValidNotifier);
                final isLoading = ref.watch(
                  registerStateProvider.select((value) => value.isLoading),
                );
                return AppButton(
                  disableButton: fieldsIsValid == false,
                  isLoading: isLoading,
                  onPressed: submitToRegister,
                  type: AppButtonType.primary,
                  child: Text(
                    "Create Account",
                    style: TextStyles.f16(context).copyWith(
                      fontWeight: FontStyles.fontWeightMedium,
                      color: fieldsIsValid ? Colors.white : null,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: Sizes.marginV24),
            AppButton(
              onPressed: () => context.go('/login'),

              type: AppButtonType.outline,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.paddingH16,
                  vertical: Sizes.paddingV4,
                ),
                child: Text("Login"),
              ),
            ),

            const SizedBox(height: Sizes.marginV64),
          ],
        ),
      ),
    );
  }
}
