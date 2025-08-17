part of 'app_logger.dart';

/// Custom logger message
class LoggerLogging extends logger.LogPrinter {
  LoggerLogging();

  @override
  List<String> log(logger.LogEvent event) {
    final color = logger.PrettyPrinter.defaultLevelColors[event.level]!;
    final emoji = logger.PrettyPrinter.defaultLevelEmojis[event.level]!;

    final stackTrace = event.stackTrace != null ? Trace.from(event.stackTrace!).terse : null;

    final message =
        '$emoji message: ${event.message} - $emoji error: ${event.error} - $emoji stackTrace: $stackTrace';
    return [color(message)];
  }
}

class CustomLogger extends logger.LogPrinter {
  CustomLogger(this.emoji);
  final String emoji;
  @override
  List<String> log(logger.LogEvent event) {
    final color = RiverAnsiColor();

    final stackTrace = event.stackTrace != null
        ? '- 🚧 stackTrace => ${Trace.from(event.stackTrace!).terse} '
        : '';
    final error = event.error != null ? '- ‼️error => ${event.error} ' : '';
    final eventMessage = event.message != null ? '= [ 📝 ] => ${event.message} ' : '';

    final message = '$emoji $eventMessage $error $stackTrace';
    return [color(message)];
  }
}

class RiverAnsiColor extends logger.AnsiColor {
  RiverAnsiColor() : super.fg(50);
}
