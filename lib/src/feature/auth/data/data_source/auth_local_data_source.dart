import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../../../../core/services/local_db/secure_storage_facade.dart';
import '../../../../core/services/local_db/shared_preferences_facade.dart';
import '../../domain/auth_tokens.dart';

part 'auth_local_data_source.g.dart';

@Riverpod(keepAlive: true)
AuthLocalDataSource authLocalDataSource(AuthLocalDataSourceRef ref) {
  final secureStorage = ref.watch(secureStorageFacadeProvider);
  final sharedPreferences = ref.watch(sharedPrefFacadeProvider);
  return AuthLocalDataSource(secureStorage, sharedPreferences);
}

@immutable
class AuthLocalDataSource {
  const AuthLocalDataSource(this.secureStorage, this.sharedPreferences);
  final SecureStorageFacade secureStorage;
  final SharedPrefFacade sharedPreferences;

  static const String authTokensKey = 'auth_tokens';
  static const String userDataKey = 'user_data';

  Future<void> cacheAuthTokens(AuthTokens tokens) async {
    await secureStorage.saveData(key: authTokensKey, value: tokens.toJson());
  }

  Future<AuthTokens> getAuthTokens() async {
    final jsonString = await secureStorage.restoreData<String?>(authTokensKey);
    if (jsonString != null) {
      return AuthTokensMapper.fromJson(jsonString);
    } else {
      throw LocalAppException(
        stackTrace: StackTrace.current,
        type: CacheExceptionType.unauthenticated,
        message: 'User does not have authentication tokens stored locally.',
      );
    }
  }

  Future<void> cacheUserData(
    Map<String, dynamic> Function() userDtoToJson,
  ) async {
    final jsonString = json.encode(userDtoToJson());
    await sharedPreferences.saveData(key: userDataKey, value: jsonString);
  }

  T getUserData<T>(T Function(Map<String, dynamic> map) userDtoFromJson) {
    final jsonString = sharedPreferences.restoreData<String>(userDataKey);
    if (jsonString != null) {
      final userDto = userDtoFromJson(
        json.decode(jsonString) as Map<String, dynamic>,
      );
      return userDto;
    } else {
      throw LocalAppException(
        stackTrace: StackTrace.current,
        message: 'User does not have any data stored locally.',
        type: CacheExceptionType.notFound,
      );
    }
  }

  Future<void> clearAuthTokens() async {
    await secureStorage.clearKey(authTokensKey);
  }

  Future<void> clearUserData() async {
    await [sharedPreferences.clearAll(), secureStorage.clearAll()].wait;
  }
}
