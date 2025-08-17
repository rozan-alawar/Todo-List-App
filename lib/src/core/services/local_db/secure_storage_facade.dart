import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_app/src/core/exceptions/app_error_extension.dart';

part 'secure_storage_facade.g.dart';

@Riverpod(keepAlive: true)
SecureStorageFacade secureStorageFacade(SecureStorageFacadeRef ref) {
  return SecureStorageFacade(
    secureStorage: const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    ),
  );
}

class SecureStorageFacade {
  SecureStorageFacade({required this.secureStorage});
  final FlutterSecureStorage secureStorage;

  Future<void> saveData({required String key, required String value}) {
    return _futureErrorHandler(
      () => secureStorage.write(key: key, value: value),
    );
  }

  Future<String?> restoreData<T>(String key) {
    return _futureErrorHandler(() => secureStorage.read(key: key));
  }

  Future<void> clearAll() async {
    return _futureErrorHandler(secureStorage.deleteAll);
  }

  Future<void> clearKey(String key) async {
    return _futureErrorHandler(() async {
      return secureStorage.delete(key: key);
    });
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
