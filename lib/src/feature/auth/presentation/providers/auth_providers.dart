import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_app/src/feature/auth/data/data_source/auth_remote_data_source.dart';

import '../../../../core/services/riverpod/widget_ref_extension.dart';
import '../../domain/user_app_model.dart';

part 'auth_providers.g.dart';

/*================== Login =================*/

@riverpod
class LoginState extends _$LoginState {
  @override
  FutureOr<Option<({UserApp user})>> build() {
    return const None();
  }

  AuthRemoteDataSource get authRemoteDataSource =>
      ref.read(authRemoteDataSourceProvider);

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final user = await authRemoteDataSource.login(email, password);
      return Some((user: user));
    });
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
