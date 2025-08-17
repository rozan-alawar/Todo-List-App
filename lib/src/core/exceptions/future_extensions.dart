import 'dart:async' as dart_async;

import 'package:logging/logging.dart';
import 'package:todo_list_app/src/core/utils/app_logger/app_logger.dart';

final _logger = Logger('Suppressed-Error')
  ..level = Level.SEVERE
  ..onRecord.listen((record) => record.logMessage());

extension FutureErrorX<T> on Future<T> {
  Future<void> suppressError({
    bool Function(Object e)? shouldSuppressError,
    bool reportAndLogError = false,
  }) async {
    try {
      await this;
    } catch (e, st) {
      if (reportAndLogError) {
        final err = _includeParallelWaitErrors(e);

        _logger.severe(
          '=> error: $err\n'
          '=> stackTrace: $st',
        );
      }

      if (shouldSuppressError?.call(e) ?? true) return;
      rethrow;
    }
  }
}

extension FutureIterableErrorX<R, T extends Iterable<R>> on Future<T> {
  Future<T> throwAllErrors() async {
    try {
      return await this;
    } catch (e) {
      if (e
          is ParallelWaitError<
            Iterable<Object?>,
            List<dart_async.AsyncError?>
          >) {
        final err = _includeParallelWaitErrors(e);
        throw Error.throwWithStackTrace(err.toString(), StackTrace.current);
      }
      rethrow;
    }
  }
}

Object _includeParallelWaitErrors(Object err) {
  if (err
      is ParallelWaitError<Iterable<Object?>, List<dart_async.AsyncError?>>) {
    return err.errors.map((e) {
      if (e?.error
          case final ParallelWaitError<
                Iterable<Object?>,
                List<dart_async.AsyncError?>
              >
              error) {
        return _includeParallelWaitErrors(error);
      }
      return '\nError: ${e?.error}\nStackTrace: ${e?.stackTrace}';
    }).toList();
  }
  return err;
}
