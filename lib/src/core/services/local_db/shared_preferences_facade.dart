import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../exceptions/app_error_extension.dart';

part 'shared_preferences_facade.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPrefAsync(SharedPrefAsyncRef ref) =>
    SharedPreferences.getInstance();

@Riverpod(keepAlive: true)
SharedPreferences _sharedPref(_SharedPrefRef ref) =>
    ref.watch(sharedPrefAsyncProvider).requireValue;

@Riverpod(keepAlive: true)
SharedPrefFacade sharedPrefFacade(SharedPrefFacadeRef ref) =>
    SharedPrefFacade(ref.watch(_sharedPrefProvider));

/// A class that provides access to the shared preferences instance.
class SharedPrefFacade {
  SharedPrefFacade(this.sharedPref);
  final SharedPreferences sharedPref;

  Future<bool> saveData({
    required String key,
    required Object value,
  }) {
    return _futureErrorHandler(() async {
      return switch (value) {
        final String value => sharedPref.setString(key, value),
        final int value => sharedPref.setInt(key, value),
        final double value => sharedPref.setDouble(key, value),
        final bool value => sharedPref.setBool(key, value),
        final List<String> value => sharedPref.setStringList(key, value),
        _ => throw UnsupportedError(
            'The type of this value is not supported. '
            'All supported types are: String | int | double | bool | List<String>.',
          ),
      };
    });
  }

  T? restoreData<T>(String key) {
    return _errorHandler(() {
      return switch (T) {
        const (String) => sharedPref.getString(key) as T?,
        const (int) => sharedPref.getInt(key) as T?,
        const (double) => sharedPref.getDouble(key) as T?,
        const (bool) => sharedPref.getBool(key) as T?,
        const (List<String>) => sharedPref.getStringList(key) as T?,
        _ => throw UnsupportedError(
            'The type of this value is not supported. '
            'All supported types are: String | int | double | bool | List<String>.',
          )
      };
    });
  }

  Future<bool> clearAll() async {
    return _futureErrorHandler(
      () async {
        return sharedPref.clear();
      },
    );
  }

  Future<bool> clearKey(String key) async {
    return _futureErrorHandler(
      () async {
        return sharedPref.remove(key);
      },
    );
  }
}

Future<T> _futureErrorHandler<T>(Future<T> Function() body) async {
  try {
    return await body.call();
  } catch (error, st) {
    final e = error.localErrorToCacheException(st);
    throw Error.throwWithStackTrace(e, st);
  }
}

T _errorHandler<T>(T Function() body) {
  try {
    return body.call();
  } catch (error, st) {
    final e = error.localErrorToCacheException(st);
    throw Error.throwWithStackTrace(e, st);
  }
}
