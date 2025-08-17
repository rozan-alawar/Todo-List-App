part of 'app_logger.dart';

extension LogRecordX on LogRecord {
  /// Log message to console
  void logMessage([String? emoji]) {
    final log = emoji != null ? customPrinter(emoji) : printer;
    return switch (level) {
      Level.CONFIG || Level.INFO => log.i(
        message,
        time: time,
        error: error,
        stackTrace: stackTrace,
      ),
      Level.WARNING => log.w(
        message,
        time: time,
        error: error,
        stackTrace: stackTrace,
      ),
      Level.SEVERE => log.e(
        message,
        time: time,
        error: error,
        stackTrace: stackTrace,
      ),
      Level.SHOUT => log.f(
        message,
        time: time,
        error: error,
        stackTrace: stackTrace,
      ),
      _ => log.d(message, time: time, error: error, stackTrace: stackTrace),
    };
  }
}
