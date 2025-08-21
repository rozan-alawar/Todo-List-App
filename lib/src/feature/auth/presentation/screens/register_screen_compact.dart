import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_list_app/src/core/config/theme/styles/styles.dart';
import 'package:todo_list_app/src/core/services/riverpod/widget_ref_extension.dart';
import 'package:todo_list_app/src/core/utils/const/sizes.dart';
import 'package:todo_list_app/src/core/utils/const/validator_fields.dart';
import 'package:todo_list_app/src/core/view/component/base/safe_scaffold.dart';
import 'package:todo_list_app/src/feature/auth/domain/register_params.dart';
import 'package:todo_list_app/src/feature/auth/presentation/components/register_form.dart';
import 'package:todo_list_app/src/feature/auth/presentation/providers/auth_providers.dart';

class RegisterScreenCompact extends HookConsumerWidget {
  const RegisterScreenCompact({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final fieldsIsValidNotifier = useValueNotifier(false);

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();

    final sectionSpace = SizedBox(height: Sizes.marginV24);
    ref.easyListen(
      registerStateProvider,
      handleLoading: false,
      whenData: (data) {
        if (data.isSome()) return context.go('/login');
      },
      whenError: (error) {
        return null;
      },
    );

    void verifyValidation() {
      final isFirstNameValid =
          ValidatorFields.isValidName(
            context,
          )?.call(firstNameController.text) ==
          null;
      final isLastNameValid =
          ValidatorFields.isValidName(context)?.call(lastNameController.text) ==
          null;
      final isEmailValid =
          ValidatorFields.isValidEmail(
            context,
          )?.call(emailController.text.trim()) ==
          null;
      final isPasswordValid =
          ValidatorFields.isValidPassword(
            context,
          )?.call(passwordController.text) ==
          null;
      final isConfPasswordValid =
          ValidatorFields.isValidPassword(
            context,
            passwordController.text,
          )?.call(confirmPasswordController.text) ==
          null;

      fieldsIsValidNotifier.value =
          isFirstNameValid &&
          isLastNameValid &&
          isEmailValid &&
          isPasswordValid &&
          isConfPasswordValid;
    }

    Future<void> submitToRegister() async {
      if (ref.read(registerStateProvider).isLoading) return;

      if (formKey.currentState!.validate() && fieldsIsValidNotifier.value) {
        final params = RegisterParams(
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
        );
        await ref.read(registerStateProvider.notifier).register(params);
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
            child: Column(
              children: [
                SizedBox(height: Sizes.marginV32),
                Text(
                  'Create New Account',
                  textAlign: TextAlign.center,
                  style: TextStyles.f24(
                    context,
                  ).copyWith(fontWeight: FontStyles.fontWeightBold),
                ),
                SizedBox(height: Sizes.marginV24),
                RegisterForm(
                  formKey: formKey,
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  sectionSpace: sectionSpace,
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                  fieldsIsValidNotifier: fieldsIsValidNotifier,
                  submitToRegister: submitToRegister,
                  verifyValidation: verifyValidation,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
