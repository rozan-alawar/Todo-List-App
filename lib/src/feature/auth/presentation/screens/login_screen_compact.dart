import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_list_app/src/core/config/theme/styles/styles.dart';
import 'package:todo_list_app/src/core/gen/app_assets.dart';
import 'package:todo_list_app/src/core/utils/const/sizes.dart';
import 'package:todo_list_app/src/core/utils/const/validator_fields.dart';
import 'package:todo_list_app/src/core/view/component/base/buttons.dart';
import 'package:todo_list_app/src/core/view/component/base/label_text_field.dart';
import 'package:todo_list_app/src/core/view/component/base/safe_scaffold.dart';
import 'package:todo_list_app/src/core/view/component/base/text_fields.dart';
import 'package:todo_list_app/src/feature/auth/presentation/providers/auth_providers.dart';

class LoginScreenCompact extends HookConsumerWidget {
  const LoginScreenCompact({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final fieldsIsValidNotifier = useValueNotifier(false);

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    // ref.easyListen(
    //   loginStateProvider,
    //   handleLoading: false,
    //   whenData: (data) {
    //     if (data.isSome()) return const HomeRoute().go(context);
    //   },
    //   whenError: (error) {
    //     if (error is NetworkException &&
    //         error.type == ServerExceptionType.otpVerify) {
    //       /// set email in provider
    //       ref
    //           .read(extraVerifyEmailProvider.notifier)
    //           .update((_) => Some(emailCtr.text.trim()));

    //       const Login$VerifyEmailRoute().go(context);
    //       return error.message;
    //     }
    //     return null;
    //   },
    // );

    void verifyValidation() {
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

      fieldsIsValidNotifier.value = isEmailValid && isPasswordValid;
    }

    Future<void> submitToLogin() async {
      context.go('/home'); // If loading, do nothing
      // if (          ref.read(loginStateProvider).isLoading) {
      //   return;
      // }

      // // If form is valid and fields are valid, submit
      // if (formKey.currentState!.validate() && fieldsIsValidNotifier.value) {
      //   final fcmToken = await ref.read(fcmServiceProvider).getFcmToken();
      //   // Call login method from provider
      //   await ref
      //       .read(loginStateProvider.notifier)
      //       .login(emailCtr.text.trim(), passwordCtr.text, fcmToken);
      // }
    }

    return SafeScaffold(
      safeTop: false,
      safeBottom: false,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Image.asset(
                  AppAssets.ASSETS_IMAGES_SPLASH_PNG,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Container(
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
                        LabelTextField(
                          label: "Email",
                          child: EmailTextField(
                            controller: emailController,
                            fillColor: Color(0xff1A2230),
                          ),
                        ),
                        const SizedBox(height: Sizes.marginV16),
                        LabelTextField(
                          label: "Password",
                          child: PasswordTextField(
                            controller: passwordController,
                            fillColor: Color(0xff1A2230),
                          ),
                        ),
                        const SizedBox(height: Sizes.marginV16),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AppButton(
                            onPressed: () {},
                            // const ForgetPasswordRoute().go(context),
                            expanded: false,
                            type: AppButtonType.text,
                            child: Text("Forgot Password?"),
                          ),
                        ),
                        const SizedBox(height: Sizes.marginV24),
                        HookConsumer(
                          builder: (context, ref, child) {
                            final fieldsIsValid = useValueListenable(
                              fieldsIsValidNotifier,
                            );
                            final isLoading = ref.watch(
                              loginStateProvider.select(
                                (value) => value.isLoading,
                              ),
                            );
                            return AppButton(
                              disableButton: fieldsIsValid == false,
                              isLoading: isLoading,
                              onPressed: submitToLogin,
                              type: AppButtonType.primary,
                              child: Text(
                                "Login",
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
                          onPressed: () {},
                          // onPressed: () =>
                          // const RegisterRoute().go(context),
                          type: AppButtonType.outline,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.paddingH16,
                              vertical: Sizes.paddingV4,
                            ),
                            child: Text("Create new account"),
                          ),
                        ),

                        const SizedBox(height: Sizes.marginV64),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
