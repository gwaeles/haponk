import 'dart:io';

import 'package:dio/dio.dart';

import 'headers.dart';

class ApiInterceptor implements Interceptor {
  Dio dio;

  ApiInterceptor(this.dio);

  @override
  Future onError(DioError e) async {
    stderr.writeln(
        "ERROR[${e?.response?.statusCode}] => PATH: ${e?.request?.path} Error : ${e?.response?.data}");
    return e; //continue
  }

  @override
  Future onRequest(RequestOptions options) async {
    dio.interceptors.requestLock.lock();
    final String headerAuthorization = "Bearer token";

    options.headers[ApiHeaders.authorization] = headerAuthorization;

    options.headers
      ..putIfAbsent(HttpHeaders.contentTypeHeader, () => "application/json");
    dio.interceptors.requestLock.unlock();
    return options;
  }

  @override
  Future onResponse(Response response) async {
    return response; // continue
  }
}
