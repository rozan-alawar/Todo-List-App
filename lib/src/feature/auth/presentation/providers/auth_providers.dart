import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/riverpod/widget_ref_extension.dart';
import '../../domain/auth_tokens.dart';
import '../../domain/user_app_model.dart';

part 'auth_providers.g.dart';

/*================== Login =================*/
@riverpod
class LoginState extends _$LoginState {
  @override
  FutureOr<Option<({AuthTokens token, UserApp user})>> build() {
    return const None();
  }

  Future<void> login(String email, String password, String fcmToken) async {
    state = const AsyncLoading();
    // state = await AsyncValue.guard(() async {
    //   final response = await ref
    //       .read(authRepoProvider)
    //       .login(email, password, fcmToken);
    //   ref
    //       .read(authTokensStateProvider.notifier)
    //       .updateAuthTokens(response.token);
    //   ref.read(authStatusProvider.notifier).authenticateUser(response.user);
    //   ref.invalidate(fetchRoundLineupProvider);
    //   await analytics.logLogin(loginMethod: 'email');
    //   return Some(response);
    // });
    // }
  }
}

/*================== Register =================*/
@riverpod
class RegisterState extends _$RegisterState {
  @override
  FutureOr<Option<Unit>> build() {
    return const None();
  }

  // Future<void> register(RegisterParams params) async {
  //   state = const AsyncLoading();
  //   state = await AsyncValue.guard(() async {
  //     await ref.read(authRepoProvider).register(params);
  //     await analytics.logSignUp(signUpMethod: 'email');
  //     return const Some(unit);
  //   });
  // }
}

/*================== VerifyForgetPasswordOtp =================*/
@riverpod
class VerifyForgetPasswordOtpState extends _$VerifyForgetPasswordOtpState {
  @override
  FutureOr<Option<({String email, String otp})>> build() {
    return const None();
  }

  // Future<void> verify(VerifyOtpParams params) async {
  //   state = const AsyncLoading();
  //   state = await AsyncValue.guard(() async {
  //     await ref.read(authRepoProvider).verifyForgotPasswordOtp(params);
  //     return Some((email: params.email, otp: params.otp));
  //   });
  // }
}

/*================== ResetPassword =================*/
@riverpod
class ResetPasswordState extends _$ResetPasswordState {
  @override
  FutureOr<Option<Unit>> build() {
    ref.keepAliveUntilNoListeners();
    return const None();
  }

  Future<void> reset(String password, String confirmPassword) async {
    // state = const AsyncLoading();
    // state = await AsyncValue.guard(() async {
    //   final emailAndOtp = ref
    //       .read(verifyForgetPasswordOtpStateProvider)
    //       .requireValue
    //       .toNullable()!;
    //   final params = ResetPasswordParams(
    //     email: emailAndOtp.email,
    //     otp: emailAndOtp.otp,
    //     password: password,
    //     confirmPassword: confirmPassword,
    //   );
    //   await ref.read(authRepoProvider).resetPassword(params);
    //   return const Some(unit);
    // });
  }
}
