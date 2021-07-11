import 'dart:io';

import 'package:dio/dio.dart';

import 'headers.dart';

class ApiInterceptor implements Interceptor {
  Dio dio;

  ApiInterceptor(this.dio);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    stderr.writeln(
        "ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path} Error : ${err.response?.data}");
    handler.next(err); //continue
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    dio.interceptors.requestLock.lock();
    final String headerAuthorization = "Bearer token";

    options.headers[ApiHeaders.authorization] = headerAuthorization;

    options.headers
      ..putIfAbsent(HttpHeaders.contentTypeHeader, () => "application/json");
    dio.interceptors.requestLock.unlock();
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response); // continue
  }
}
