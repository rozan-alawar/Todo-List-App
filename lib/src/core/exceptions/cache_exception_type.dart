part of 'app_exception.dart';

enum CacheExceptionType {
  unknown,
  general,
  cancelled,
  validation,
  unauthenticated, //Thrown when auth tokens are not found
  notFound, //Thrown when cache is empty or not found
  expired; //Thrown when cache is expired
}
