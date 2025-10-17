import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'app_exception.dart';

extension AppErrorExtension on Object? {
  String errorMessage(BuildContext context) {
    final error = this;
    if (error is BaseAppException) {
      return switch (error) {
        NetworkException() => error.serverErrorMessage(context),
        LocalAppException() => error.cacheErrorMessage(context),
      };
    }
    return error.toString();
  }

  bool get shouldSkipError {
    return switch (this) {
      final LocalAppException err
          when err.type == CacheExceptionType.notFound ||
              err.type == CacheExceptionType.unauthenticated ||
              err.type == CacheExceptionType.cancelled =>
        true,
      final NetworkException err
          when err.type == ServerExceptionType.unauthorized ||
              (err.type == ServerExceptionType.general) =>
        true,
      _ => false,
    };
  }
}

extension _ServerErrorExtension on NetworkException {
  String serverErrorMessage(BuildContext context) {
    switch (type) {
      case ServerExceptionType.general:
        return message; //Business logic error message from the backend
      case ServerExceptionType.otpVerify:
        return message;
      case ServerExceptionType.validation:
        return message;
      case ServerExceptionType.unauthorized:
        return "unauthorizedError";
      case ServerExceptionType.forbidden:
        return "forbiddenError";
      case ServerExceptionType.notFound:
        return "notFoundError";
      case ServerExceptionType.conflict:
        return "conflictError";
      case ServerExceptionType.internal:
        return "internalError";
      case ServerExceptionType.serviceUnavailable:
        return "serviceUnavailableError";
      case ServerExceptionType.timeOut:
        return "timeoutError";
      case ServerExceptionType.noInternet:
        return "noInternetError";
      case ServerExceptionType.unknown:
        return "unknownError";
    }
  }
}

extension _CacheErrorExtension on LocalAppException {
  String cacheErrorMessage(BuildContext context) {
    return switch (type) {
      CacheExceptionType.general => message,
      CacheExceptionType.validation => message,
      _ => "unknownError",
    };
  }
}

extension LocaleErrorExtension on Object {
  LocalAppException localErrorToCacheException([StackTrace? stackTrace]) {
    final error = this;

    if (error is LocalAppException &&
        error.type == CacheExceptionType.general) {
      return error;
    }
    return LocalAppException(
      type: CacheExceptionType.unknown,
      stackTrace: stackTrace,
      message: error.toString(),
    );
  }
}

extension MainApiErrorExtension on Object {
  NetworkException mainApiErrorToServerException([StackTrace? stackTrace]) {
    final error = this;

    if (error is DioException) {
      return error.dioToServerException(stackTrace);
    }

    return NetworkException(
      type: ServerExceptionType.unknown,
      message: error.toString(),
      stackTrace: stackTrace,
    );
  }
}

extension _DioErrorExtension on DioException {
  NetworkException dioToServerException([StackTrace? stackTrace]) {
    final statusCode = response?.statusCode;
    final message = error?.toString() ?? '';

    switch (type) {
      case DioExceptionType.badResponse:
        switch (statusCode) {
          case 202: // Need to OTP
            return NetworkException(
              type: ServerExceptionType.otpVerify,
              message: message,
              code: statusCode,
              stackTrace: stackTrace,
              apiErrorCode:
                  (response!.data as Map<dynamic, dynamic>)['errorCode']
                      .toString(),
            );
          case 422: // Validation Error
            return NetworkException(
              type: ServerExceptionType.validation,
              message: message,
              code: statusCode,
              stackTrace: stackTrace,
              apiErrorCode:
                  (response!.data as Map<dynamic, dynamic>)['errorCode']
                      .toString(),
            );
          //400 is our business logic errors code.
          //It's handled by error interceptors of each API.
          case 400:
            return NetworkException(
              type: ServerExceptionType.general,
              message: message,
              code: statusCode,
              stackTrace: stackTrace,
              apiErrorCode:
                  (response!.data as Map<dynamic, dynamic>)['errorCode']
                      .toString(),
            );
          case 401:
            return NetworkException(
              type: ServerExceptionType.unauthorized,
              message: message,
              stackTrace: stackTrace,
              code: statusCode,
            );
          case 403:
            return NetworkException(
              type: ServerExceptionType.forbidden,
              message: message,
              stackTrace: stackTrace,
              code: statusCode,
            );
          case 404:
          case 405:
          case 501:
            return NetworkException(
              type: ServerExceptionType.notFound,
              message: message,
              stackTrace: stackTrace,
              code: statusCode,
            );
          case 409:
            return NetworkException(
              type: ServerExceptionType.conflict,
              message: message,
              stackTrace: stackTrace,
              code: statusCode,
            );
          case 500:
          case 502:
            return NetworkException(
              type: ServerExceptionType.internal,
              message: message,
              stackTrace: stackTrace,
              code: statusCode,
            );
          case 503:
            return NetworkException(
              type: ServerExceptionType.serviceUnavailable,
              message: message,
              stackTrace: stackTrace,
              code: statusCode,
            );
          default:
            return NetworkException(
              type: ServerExceptionType.unknown,
              message: message,
              stackTrace: stackTrace,
              code: statusCode,
            );
        }

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException(
          type: ServerExceptionType.timeOut,
          message: message,
          stackTrace: stackTrace,
          code: 408,
        );

      case DioExceptionType.connectionError:
        return NetworkException(
          type: ServerExceptionType.noInternet,
          message: message,
          stackTrace: stackTrace,
          code: 101,
        );

      case DioExceptionType.badCertificate:
        return NetworkException(
          type: ServerExceptionType.unknown,
          message: message,
          stackTrace: stackTrace,
          code: statusCode,
        );

      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        return NetworkException(
          type: ServerExceptionType.unknown,
          message: message,
          stackTrace: stackTrace,
          code: statusCode,
        );
    }
  }
}

extension LocalErrorExtension on Object {
  LocalAppException localErrorToLocalException() {
    final error = this;

    return error is LocalAppException
        ? error
        : LocalAppException(
            type: CacheExceptionType.unknown,
            message: error.toString(),
          );
  }
}
