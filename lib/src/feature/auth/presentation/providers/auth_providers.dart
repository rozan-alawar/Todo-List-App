import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_app/src/core/services/local_db/shared_preferences_facade.dart';
import 'package:todo_list_app/src/feature/auth/data/data_source/auth_remote_data_source.dart';
import 'package:todo_list_app/src/feature/auth/domain/register_params.dart';

import '../../domain/user_app_model.dart';

part 'auth_providers.g.dart';

/*================== Login =================*/

@riverpod
class LoginState extends _$LoginState {
  @override
  FutureOr<Option<({UserApp user})>> build() async {
    final sharedPrefs = ref.read(sharedPreferencesServiceProvider);

    final isLoggedIn = await sharedPrefs.isLoggedIn();
    if (!isLoggedIn) return None();

    final savedUser = await sharedPrefs.getUser();
    if (savedUser != null) return Some((user: savedUser));

    return const None();
  }

  AuthRemoteDataSource get authRemoteDataSource =>
      ref.read(authRemoteDataSourceProvider);

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final sharedPrefs = ref.read(sharedPreferencesServiceProvider);
      final user = await authRemoteDataSource.login(email, password);

      await sharedPrefs.saveUser(user);
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

  Future<void> register(RegisterParams params) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final sharedPrefs = ref.read(sharedPreferencesServiceProvider);

      final user = await ref
          .read(authRemoteDataSourceProvider)
          .register(params);
      await sharedPrefs.saveUser(user);
      return const Some(unit);
    });
  }
}

/*================== Logout =================*/
@riverpod
class LogoutState extends _$LogoutState {
  @override
  FutureOr<Option<Unit>> build() {
    return const None();
  }

  Future<void> logout() async {
    state = const AsyncLoading();

    try {
      final sharedPrefs = ref.read(sharedPreferencesServiceProvider);
      final authDataSource = ref.read(authRemoteDataSourceProvider);

      await authDataSource.logout();

      await sharedPrefs.clearUser();

      ref.read(loginStateProvider.notifier).build();

      state = AsyncData(some(unit));
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);

      rethrow;
    }
  }
}
