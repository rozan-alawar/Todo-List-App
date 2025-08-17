import 'package:flutter/foundation.dart';

part 'cache_exception_type.dart';
part 'server_exception_type.dart';

@immutable
sealed class BaseAppException implements Exception {
  const BaseAppException({
    required this.message,
    this.stackTrace,
    this.code,
  });

  /// Message of the exception
  final String message;

  final StackTrace? stackTrace;

  final int? code;
}

@immutable
final class LocalAppException extends BaseAppException {
  const LocalAppException({
    required super.message,
    required this.type,
    super.stackTrace,
    super.code,
  });
  final CacheExceptionType type;
  @override
  String toString() =>
      'LocalAppException(message: $message , type: $type , stackTrace: $stackTrace)';
}

@immutable
class NetworkException extends BaseAppException {
  const NetworkException({
    required super.message,
    required this.type,
    super.stackTrace,
    this.apiErrorCode,
    super.code,
  });

  final ServerExceptionType type;
  final String? apiErrorCode;

  @override
  String toString() =>
      'NetworkException(message: $message , type: $type , apiErrorCode: $apiErrorCode  stackTrace: $stackTrace)';
}
