import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'api_interceptor.dart';

Dio configureDio() {
  final Dio dio = Dio();
  dio.interceptors.add(ApiInterceptor(dio));

  if (!kIsWeb) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
  return dio;
}
