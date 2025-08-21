// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginStateHash() => r'4f670f8735faf419c63d887dd944e5a5058b93e5';

/// See also [LoginState].
@ProviderFor(LoginState)
final loginStateProvider =
    AutoDisposeAsyncNotifierProvider<
      LoginState,
      Option<({UserApp user})>
    >.internal(
      LoginState.new,
      name: r'loginStateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$loginStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$LoginState = AutoDisposeAsyncNotifier<Option<({UserApp user})>>;
String _$registerStateHash() => r'57d27de0ae3913af0446f49af8e7e4ca3aa76443';

/// See also [RegisterState].
@ProviderFor(RegisterState)
final registerStateProvider =
    AutoDisposeAsyncNotifierProvider<RegisterState, Option<Unit>>.internal(
      RegisterState.new,
      name: r'registerStateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$registerStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RegisterState = AutoDisposeAsyncNotifier<Option<Unit>>;
String _$verifyForgetPasswordOtpStateHash() =>
    r'25ce0084be5cef23627c05d93231f1b2574442a9';

/// See also [VerifyForgetPasswordOtpState].
@ProviderFor(VerifyForgetPasswordOtpState)
final verifyForgetPasswordOtpStateProvider =
    AutoDisposeAsyncNotifierProvider<
      VerifyForgetPasswordOtpState,
      Option<({String email, String otp})>
    >.internal(
      VerifyForgetPasswordOtpState.new,
      name: r'verifyForgetPasswordOtpStateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$verifyForgetPasswordOtpStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$VerifyForgetPasswordOtpState =
    AutoDisposeAsyncNotifier<Option<({String email, String otp})>>;
String _$resetPasswordStateHash() =>
    r'3889f7ca61373c78870e882401468dbdef7834bc';

/// See also [ResetPasswordState].
@ProviderFor(ResetPasswordState)
final resetPasswordStateProvider =
    AutoDisposeAsyncNotifierProvider<ResetPasswordState, Option<Unit>>.internal(
      ResetPasswordState.new,
      name: r'resetPasswordStateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$resetPasswordStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ResetPasswordState = AutoDisposeAsyncNotifier<Option<Unit>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
