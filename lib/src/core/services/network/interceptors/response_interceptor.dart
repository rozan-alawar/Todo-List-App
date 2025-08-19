import 'package:dio/dio.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    // analytics.logEvent(
    //   name: 'api_response',
    //   parameters: {
    //     'status_code': '${response.statusCode}',
    //     'url': response.requestOptions.uri.toString(),
    //     'method': response.requestOptions.method,
    //     'response': response.data.toString(),
    //   },
    // );
    if (response.data case final Map<dynamic, dynamic> responseData) {
      final pagination = responseData['pagination'] as Map<dynamic, dynamic>?;

      if (pagination != null) {
        final meta = pagination['meta'] as Map<dynamic, dynamic>?; // Meta data.
        final data = responseData['data'] as List<dynamic>?; // List of items.
        return handler.next(
          response..data = {'meta': meta?['page'], 'items': data},
        );
      } else if (responseData['data'] case final data?) {
        return data is List<dynamic>
            ? handler.next(response..data = {'items': data})
            : handler.next(response..data = data);
      }
    }
    return handler.next(response);
  }
}
