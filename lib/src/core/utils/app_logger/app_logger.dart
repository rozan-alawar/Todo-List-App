import 'package:logger/logger.dart' as logger;
import 'package:logging/logging.dart';
import 'package:stack_trace/stack_trace.dart';

part 'logging.dart';
part 'printer_logger.dart';

final printer = logger.Logger(printer: LoggerLogging());

logger.Logger customPrinter(String emoji) =>
    logger.Logger(printer: CustomLogger(emoji));
