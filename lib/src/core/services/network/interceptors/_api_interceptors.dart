import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '_api_interceptors.g.dart';

@Riverpod(keepAlive: true)
IList<Interceptor> apiInterceptors(ApiInterceptorsRef ref) =>
    throw Exception('ApiInterceptorsProvider must be set at ProviderScope overrides.');
