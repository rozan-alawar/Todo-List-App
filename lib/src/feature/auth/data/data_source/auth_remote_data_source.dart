import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_app/src/core/gen/app_assets.dart';
import 'package:todo_list_app/src/core/services/firebase_config/firebase_config.dart';
import 'package:todo_list_app/src/feature/auth/domain/register_params.dart';
import 'package:todo_list_app/src/feature/auth/domain/user_app_model.dart';

part 'auth_remote_data_source.g.dart';

@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return AuthRemoteDataSource();
}

@immutable
class AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get loginPath => '/login';
  String get registerPath => '/register';
  String get verifyOtpPath => '/verify-otp';
  String get sendOtpPath => '/send-otp';
  String get resetPasswordPath => '/reset-password';
  String get deleteUserPath => '/user/delete';
  String get verifySocialTokenPath => '/auth/verify-social-token';

  UserApp? _userFromFirebase(User? user) {
    if (user == null) return null;

    return UserApp(
      id: user.uid,
      fullName: user.displayName ?? "Null",
      email: user.email ?? "Null",
      phone: user.phoneNumber ?? "Null",
      imageUrl: user.photoURL ?? AppAssets.ASSETS_IMAGES_PLACEHOLDER_PNG,
    );
  }

  // =====================================================
  //                      Login
  // =====================================================

  Future<UserApp> login(String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = _userFromFirebase(userCredential.user);

    if (user == null) {
      throw const UnknownFailure('Failed to sign in');
    }

    return user;
  }

  // =====================================================
  //                      Register
  // =====================================================

  Future<UserApp> register(RegisterParams params) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );

    final displayName = "${params.firstName} ${params.lastName}".trim();
    await userCredential.user?.updateDisplayName(displayName);

    final user = _userFromFirebase(userCredential.user);

    if (user == null) {
      throw const UnknownFailure('Failed to create account');
    }

    return user;
  }

  // =====================================================
  //                   Current User
  // =====================================================
  UserApp? getCurrentUser() {
    final user = _auth.currentUser;
    return _userFromFirebase(user);
  }

  // =====================================================
  //                   Auth State Stream
  // =====================================================
  Stream<UserApp?> get authStateChanges {
    return _auth.authStateChanges().map(_userFromFirebase);
  }
}
