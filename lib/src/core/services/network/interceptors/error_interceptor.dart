import 'package:dio/dio.dart';

extension ValidationsError<T> on Response<T> {
  bool get isOtpValidationError => statusCode == 202;
}

class _RejectError implements Exception {
  const _RejectError(this.message);

  final String message;
}

class ErrorInterceptor extends Interceptor {
  ErrorInterceptor();

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final data = response.data as Map<String, dynamic>;

    // analytics.logEvent(
    //   name: 'api_response_error',
    //   parameters: {
    //     'status_code': '${response.statusCode}',
    //     'url': response.requestOptions.uri.toString(),
    //     'method': response.requestOptions.method,
    //     'response': response.data.toString(),
    //   },
    // );
    if (data['status'] != true || response.isOtpValidationError) {
      final dioException = DioException(
        response: response,
        requestOptions: response.requestOptions,
        error: _RejectError('${data['message']}'),
        message: '${data['message']}',
        stackTrace: StackTrace.current,
        type: DioExceptionType.badResponse,
      );
      return handler.reject(dioException, true);
    }
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;

    if ([400, 404, 409, 422].any((code) => code == statusCode) ||
        err.error is _RejectError) {
      final response = err.response!;
      final data = response.data as Map<String, dynamic>;
      final error = data['message'];
      final response2 = Response(
        statusCode: response.statusCode,
        data: data,
        requestOptions: response.requestOptions,
        statusMessage: response.statusMessage,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        extra: response.extra,
        headers: response.headers,
      );
      final newErr = err.copyWith(
        response: response2,
        error: error,
        message: '$error',
        type: DioExceptionType.badResponse,
      );
      return handler.reject(newErr);
    }
    return handler.next(err);
  }
}
