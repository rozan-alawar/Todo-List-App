// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:todo_list_app/src/feature/auth/domain/auth_tokens.dart';
// import 'package:todo_list_app/src/feature/auth/domain/user_app_model.dart';

// @Riverpod(keepAlive: true)
// AuthRemoteDataSource authRemoteDataSource(Ref ref) {
//   return AuthRemoteDataSource(ref.watch(networkServiceProvider));
// }

// @immutable
// class AuthRemoteDataSource {
//   const AuthRemoteDataSource(this.mainApiFacade);
//   final NetworkService mainApiFacade;

//   String get loginPath => '/login';
//   String get registerPath => '/register';
//   String get verifyOtpPath => '/verify-otp';
//   String get sendOtpPath => '/send-otp';
//   String get resetPasswordPath => '/reset-password';
//   String get deleteUserPath => '/user/delete';
//   String get verifySocialTokenPath => '/auth/verify-social-token';

//   Future<({UserApp user, AuthTokens token})> login(
//     String email,
//     String password,
//     String fcmToken,
//   ) async {
//     final response = await mainApiFacade.post<Map<String, dynamic>>(
//       path: loginPath,
//       data: {'email': email, 'password': password, 'fcm_token': fcmToken},
//     );
//     return convertToUserModel(response.data!);
//   }
// }
