// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginStateHash() => r'288d0a7dfdc9ea383d8f761d9897f10db7e33cf7';

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
String _$registerStateHash() => r'11c6809c62d049faa88704ed85e5b8713ff04e16';

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
String _$logoutStateHash() => r'78034894da326b1371b31395c99a18f4ef51f276';

/// See also [LogoutState].
@ProviderFor(LogoutState)
final logoutStateProvider =
    AutoDisposeAsyncNotifierProvider<LogoutState, Option<Unit>>.internal(
      LogoutState.new,
      name: r'logoutStateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$logoutStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$LogoutState = AutoDisposeAsyncNotifier<Option<Unit>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
