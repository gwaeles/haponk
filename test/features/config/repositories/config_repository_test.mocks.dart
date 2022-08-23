// Mocks generated by Mockito 5.3.0 from annotations
// in haponk/test/features/config/repositories/config_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;

import 'package:dio/src/adapter.dart' as _i4;
import 'package:dio/src/cancel_token.dart' as _i11;
import 'package:dio/src/dio.dart' as _i10;
import 'package:dio/src/dio_mixin.dart' as _i6;
import 'package:dio/src/headers.dart' as _i8;
import 'package:dio/src/options.dart' as _i3;
import 'package:dio/src/redirect_record.dart' as _i12;
import 'package:dio/src/response.dart' as _i7;
import 'package:dio/src/transformer.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeIOSOptions_0 extends _i1.SmartFake implements _i2.IOSOptions {
  _FakeIOSOptions_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeAndroidOptions_1 extends _i1.SmartFake
    implements _i2.AndroidOptions {
  _FakeAndroidOptions_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeLinuxOptions_2 extends _i1.SmartFake implements _i2.LinuxOptions {
  _FakeLinuxOptions_2(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeWindowsOptions_3 extends _i1.SmartFake
    implements _i2.WindowsOptions {
  _FakeWindowsOptions_3(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeWebOptions_4 extends _i1.SmartFake implements _i2.WebOptions {
  _FakeWebOptions_4(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeMacOsOptions_5 extends _i1.SmartFake implements _i2.MacOsOptions {
  _FakeMacOsOptions_5(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeBaseOptions_6 extends _i1.SmartFake implements _i3.BaseOptions {
  _FakeBaseOptions_6(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeHttpClientAdapter_7 extends _i1.SmartFake
    implements _i4.HttpClientAdapter {
  _FakeHttpClientAdapter_7(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeTransformer_8 extends _i1.SmartFake implements _i5.Transformer {
  _FakeTransformer_8(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeInterceptors_9 extends _i1.SmartFake implements _i6.Interceptors {
  _FakeInterceptors_9(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeResponse_10<T> extends _i1.SmartFake implements _i7.Response<T> {
  _FakeResponse_10(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeHeaders_11 extends _i1.SmartFake implements _i8.Headers {
  _FakeHeaders_11(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeRequestOptions_12 extends _i1.SmartFake
    implements _i3.RequestOptions {
  _FakeRequestOptions_12(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeUri_13 extends _i1.SmartFake implements Uri {
  _FakeUri_13(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [FlutterSecureStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockFlutterSecureStorage extends _i1.Mock
    implements _i2.FlutterSecureStorage {
  MockFlutterSecureStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IOSOptions get iOptions => (super.noSuchMethod(
          Invocation.getter(#iOptions),
          returnValue: _FakeIOSOptions_0(this, Invocation.getter(#iOptions)))
      as _i2.IOSOptions);
  @override
  _i2.AndroidOptions get aOptions =>
      (super.noSuchMethod(Invocation.getter(#aOptions),
              returnValue:
                  _FakeAndroidOptions_1(this, Invocation.getter(#aOptions)))
          as _i2.AndroidOptions);
  @override
  _i2.LinuxOptions get lOptions => (super.noSuchMethod(
          Invocation.getter(#lOptions),
          returnValue: _FakeLinuxOptions_2(this, Invocation.getter(#lOptions)))
      as _i2.LinuxOptions);
  @override
  _i2.WindowsOptions get wOptions =>
      (super.noSuchMethod(Invocation.getter(#wOptions),
              returnValue:
                  _FakeWindowsOptions_3(this, Invocation.getter(#wOptions)))
          as _i2.WindowsOptions);
  @override
  _i2.WebOptions get webOptions => (super.noSuchMethod(
          Invocation.getter(#webOptions),
          returnValue: _FakeWebOptions_4(this, Invocation.getter(#webOptions)))
      as _i2.WebOptions);
  @override
  _i2.MacOsOptions get mOptions => (super.noSuchMethod(
          Invocation.getter(#mOptions),
          returnValue: _FakeMacOsOptions_5(this, Invocation.getter(#mOptions)))
      as _i2.MacOsOptions);
  @override
  _i9.Future<void> write(
          {String? key,
          String? value,
          _i2.IOSOptions? iOptions,
          _i2.AndroidOptions? aOptions,
          _i2.LinuxOptions? lOptions,
          _i2.WebOptions? webOptions,
          _i2.MacOsOptions? mOptions,
          _i2.WindowsOptions? wOptions}) =>
      (super.noSuchMethod(
              Invocation.method(#write, [], {
                #key: key,
                #value: value,
                #iOptions: iOptions,
                #aOptions: aOptions,
                #lOptions: lOptions,
                #webOptions: webOptions,
                #mOptions: mOptions,
                #wOptions: wOptions
              }),
              returnValue: _i9.Future<void>.value(),
              returnValueForMissingStub: _i9.Future<void>.value())
          as _i9.Future<void>);
  @override
  _i9.Future<String?> read(
          {String? key,
          _i2.IOSOptions? iOptions,
          _i2.AndroidOptions? aOptions,
          _i2.LinuxOptions? lOptions,
          _i2.WebOptions? webOptions,
          _i2.MacOsOptions? mOptions,
          _i2.WindowsOptions? wOptions}) =>
      (super.noSuchMethod(
          Invocation.method(#read, [], {
            #key: key,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions
          }),
          returnValue: _i9.Future<String?>.value()) as _i9.Future<String?>);
  @override
  _i9.Future<bool> containsKey(
          {String? key,
          _i2.IOSOptions? iOptions,
          _i2.AndroidOptions? aOptions,
          _i2.LinuxOptions? lOptions,
          _i2.WebOptions? webOptions,
          _i2.MacOsOptions? mOptions,
          _i2.WindowsOptions? wOptions}) =>
      (super.noSuchMethod(
          Invocation.method(#containsKey, [], {
            #key: key,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions
          }),
          returnValue: _i9.Future<bool>.value(false)) as _i9.Future<bool>);
  @override
  _i9.Future<void> delete(
          {String? key,
          _i2.IOSOptions? iOptions,
          _i2.AndroidOptions? aOptions,
          _i2.LinuxOptions? lOptions,
          _i2.WebOptions? webOptions,
          _i2.MacOsOptions? mOptions,
          _i2.WindowsOptions? wOptions}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [], {
                #key: key,
                #iOptions: iOptions,
                #aOptions: aOptions,
                #lOptions: lOptions,
                #webOptions: webOptions,
                #mOptions: mOptions,
                #wOptions: wOptions
              }),
              returnValue: _i9.Future<void>.value(),
              returnValueForMissingStub: _i9.Future<void>.value())
          as _i9.Future<void>);
  @override
  _i9.Future<Map<String, String>> readAll(
          {_i2.IOSOptions? iOptions,
          _i2.AndroidOptions? aOptions,
          _i2.LinuxOptions? lOptions,
          _i2.WebOptions? webOptions,
          _i2.MacOsOptions? mOptions,
          _i2.WindowsOptions? wOptions}) =>
      (super.noSuchMethod(
              Invocation.method(#readAll, [], {
                #iOptions: iOptions,
                #aOptions: aOptions,
                #lOptions: lOptions,
                #webOptions: webOptions,
                #mOptions: mOptions,
                #wOptions: wOptions
              }),
              returnValue:
                  _i9.Future<Map<String, String>>.value(<String, String>{}))
          as _i9.Future<Map<String, String>>);
  @override
  _i9.Future<void> deleteAll(
          {_i2.IOSOptions? iOptions,
          _i2.AndroidOptions? aOptions,
          _i2.LinuxOptions? lOptions,
          _i2.WebOptions? webOptions,
          _i2.MacOsOptions? mOptions,
          _i2.WindowsOptions? wOptions}) =>
      (super.noSuchMethod(
              Invocation.method(#deleteAll, [], {
                #iOptions: iOptions,
                #aOptions: aOptions,
                #lOptions: lOptions,
                #webOptions: webOptions,
                #mOptions: mOptions,
                #wOptions: wOptions
              }),
              returnValue: _i9.Future<void>.value(),
              returnValueForMissingStub: _i9.Future<void>.value())
          as _i9.Future<void>);
}

/// A class which mocks [Dio].
///
/// See the documentation for Mockito's code generation for more information.
class MockDio extends _i1.Mock implements _i10.Dio {
  MockDio() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.BaseOptions get options => (super.noSuchMethod(
          Invocation.getter(#options),
          returnValue: _FakeBaseOptions_6(this, Invocation.getter(#options)))
      as _i3.BaseOptions);
  @override
  set options(_i3.BaseOptions? _options) =>
      super.noSuchMethod(Invocation.setter(#options, _options),
          returnValueForMissingStub: null);
  @override
  _i4.HttpClientAdapter get httpClientAdapter =>
      (super.noSuchMethod(Invocation.getter(#httpClientAdapter),
              returnValue: _FakeHttpClientAdapter_7(
                  this, Invocation.getter(#httpClientAdapter)))
          as _i4.HttpClientAdapter);
  @override
  set httpClientAdapter(_i4.HttpClientAdapter? _httpClientAdapter) => super
      .noSuchMethod(Invocation.setter(#httpClientAdapter, _httpClientAdapter),
          returnValueForMissingStub: null);
  @override
  _i5.Transformer get transformer =>
      (super.noSuchMethod(Invocation.getter(#transformer),
              returnValue:
                  _FakeTransformer_8(this, Invocation.getter(#transformer)))
          as _i5.Transformer);
  @override
  set transformer(_i5.Transformer? _transformer) =>
      super.noSuchMethod(Invocation.setter(#transformer, _transformer),
          returnValueForMissingStub: null);
  @override
  _i6.Interceptors get interceptors =>
      (super.noSuchMethod(Invocation.getter(#interceptors),
              returnValue:
                  _FakeInterceptors_9(this, Invocation.getter(#interceptors)))
          as _i6.Interceptors);
  @override
  void close({bool? force = false}) =>
      super.noSuchMethod(Invocation.method(#close, [], {#force: force}),
          returnValueForMissingStub: null);
  @override
  _i9.Future<_i7.Response<T>> get<T>(String? path,
          {Map<String, dynamic>? queryParameters,
          _i3.Options? options,
          _i11.CancelToken? cancelToken,
          _i3.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
          Invocation.method(#get, [
            path
          ], {
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onReceiveProgress: onReceiveProgress
          }),
          returnValue: _i9.Future<_i7.Response<T>>.value(_FakeResponse_10<T>(
              this,
              Invocation.method(#get, [
                path
              ], {
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onReceiveProgress: onReceiveProgress
              })))) as _i9.Future<_i7.Response<T>>);
  @override
  _i9.Future<_i7.Response<T>> getUri<T>(Uri? uri,
          {_i3.Options? options,
          _i11.CancelToken? cancelToken,
          _i3.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
          Invocation.method(#getUri, [
            uri
          ], {
            #options: options,
            #cancelToken: cancelToken,
            #onReceiveProgress: onReceiveProgress
          }),
          returnValue: _i9.Future<_i7.Response<T>>.value(_FakeResponse_10<T>(
              this,
              Invocation.method(#getUri, [
                uri
              ], {
                #options: options,
                #cancelToken: cancelToken,
                #onReceiveProgress: onReceiveProgress
              })))) as _i9.Future<_i7.Response<T>>);
  @override
  _i9.Future<_i7.Response<T>> post<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i3.Options? options,
          _i11.CancelToken? cancelToken,
          _i3.ProgressCallback? onSendProgress,
          _i3.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
          Invocation.method(#post, [
            path
          ], {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress
          }),
          returnValue: _i9.Future<_i7.Response<T>>.value(_FakeResponse_10<T>(
              this,
              Invocation.method(#post, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              })))) as _i9.Future<_i7.Response<T>>);
  @override
  _i9.Future<_i7.Response<T>> postUri<T>(Uri? uri,
          {dynamic data,
          _i3.Options? options,
          _i11.CancelToken? cancelToken,
          _i3.ProgressCallback? onSendProgress,
          _i3.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
          Invocation.method(#postUri, [
            uri
          ], {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress
          }),
          returnValue: _i9.Future<_i7.Response<T>>.value(_FakeResponse_10<T>(
              this,
              Invocation.method(#postUri, [
                uri
              ], {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              })))) as _i9.Future<_i7.Response<T>>);
  @override
  _i9.Future<_i7.Response<T>> put<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i3.Options? options,
          _i11.CancelToken? cancelToken,
          _i3.ProgressCallback? onSendProgress,
          _i3.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
          Invocation.method(#put, [
            path
          ], {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress
          }),
          returnValue: _i9.Future<_i7.Response<T>>.value(_FakeResponse_10<T>(
              this,
              Invocation.method(#put, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              })))) as _i9.Future<_i7.Response<T>>);
  @override
  _i9.Future<_i7.Response<T>> putUri<T>(Uri? uri,
          {dynamic data,
          _i3.Options? options,
          _i11.CancelToken? cancelToken,
          _i3.ProgressCallback? onSendProgress,
          _i3.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
          Invocation.method(#putUri, [
            uri
          ], {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress
          }),
          returnValue: _i9.Future<_i7.Response<T>>.value(_FakeResponse_10<T>(
              this,
              Invocation.method(#putUri, [
                uri
              ], {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              })))) as _i9.Future<_i7.Response<T>>);
  @override
  _i9.Future<_i7.Response<T>> head<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i3.Options? options,
          _i11.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
          Invocation.method(#head, [
            path
          ], {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken
          }),
          returnValue: _i9.Future<_i7.Response<T>>.value(_FakeResponse_10<T>(
              this,
              Invocation.method(#head, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken
              })))) as _i9.Future<_i7.Response<T>>);
  @override
  _i9.Future<_i7.Response<T>> headUri<T>(Uri? uri,
          {dynamic data,
          _i3.Options? options,
          _i11.CancelToken? cancelToken}) =>
      (super.noSuchMethod(Invocation.method(#headUri, [uri], {#data: data, #options: options, #cancelToken: cancelToken}),
          returnValue: _i9.Future<_i7.Response<T>>.value(_FakeResponse_10<T>(
              this,
              Invocation.method(#headUri, [
                uri
              ], {
                #data: data,
                #options: options,
                #cancelToken: cancelToken
              })))) as _i9.Future<_i7.Response<T>>);
  @override
  _i9.Future<_i7.Response<T>> delete<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i3.Options? options,
          _i11.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
          Invocation.method(#delete, [
            path
          ], {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken
          }),
          returnValue: _i9.Future<_i7.Response<T>>.value(_FakeResponse_10<T>(
              this,
              Invocation.method(#delete, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken
              })))) as _i9.Future<_i7.Response<T>>);
  @override
  _i9.Future<_i7.Response<T>> deleteUri<T>(Uri? uri,
          {dynamic data,
          _i3.Options? options,
          _i11.CancelToken? cancelToken}) =>
      (super.noSuchMethod(Invocation.method(#deleteUri, [uri], {#data: data, #options: options, #cancelToken: cancelToken}),
          returnValue: _i9.Future<_i7.Response<T>>.value(_FakeResponse_10<T>(
              this,
              Invocation.method(#deleteUri, [
                uri
              ], {
                #data: data,
                #options: options,
                #cancelToken: cancelToken
              })))) as _i9.Future<_i7.Response<T>>);
  @override
  _i9.Future<_i7.Response<T>> patch<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i3.Options? options,
          _i11.CancelToken? cancelToken,
          _i3.ProgressCallback? onSendProgress,
          _i3.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
          Invocation.method(#patch, [
            path
          ], {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress
          }),
          returnValue: _i9.Future<_i7.Response<T>>.value(_FakeResponse_10<T>(
              this,
              Invocation.method(#patch, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              })))) as _i9.Future<_i7.Response<T>>);
  @override
  _i9.Future<_i7.Response<T>> patchUri<T>(Uri? uri,
          {dynamic data,
          _i3.Options? options,
          _i11.CancelToken? cancelToken,
          _i3.ProgressCallback? onSendProgress,
          _i3.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
          Invocation.method(#patchUri, [
            uri
          ], {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress
          }),
          returnValue: _i9.Future<_i7.Response<T>>.value(_FakeResponse_10<T>(
              this,
              Invocation.method(#patchUri, [
                uri
              ], {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              })))) as _i9.Future<_i7.Response<T>>);
  @override
  void lock() => super.noSuchMethod(Invocation.method(#lock, []),
      returnValueForMissingStub: null);
  @override
  void unlock() => super.noSuchMethod(Invocation.method(#unlock, []),
      returnValueForMissingStub: null);
  @override
  void clear() => super.noSuchMethod(Invocation.method(#clear, []),
      returnValueForMissingStub: null);
  @override
  _i9.Future<_i7.Response<dynamic>> download(String? urlPath, dynamic savePath,
          {_i3.ProgressCallback? onReceiveProgress,
          Map<String, dynamic>? queryParameters,
          _i11.CancelToken? cancelToken,
          bool? deleteOnError = true,
          String? lengthHeader = r'content-length',
          dynamic data,
          _i3.Options? options}) =>
      (super.noSuchMethod(
          Invocation.method(#download, [
            urlPath,
            savePath
          ], {
            #onReceiveProgress: onReceiveProgress,
            #queryParameters: queryParameters,
            #cancelToken: cancelToken,
            #deleteOnError: deleteOnError,
            #lengthHeader: lengthHeader,
            #data: data,
            #options: options
          }),
          returnValue:
              _i9.Future<_i7.Response<dynamic>>.value(_FakeResponse_10<dynamic>(
                  this,
                  Invocation.method(#download, [
                    urlPath,
                    savePath
                  ], {
                    #onReceiveProgress: onReceiveProgress,
                    #queryParameters: queryParameters,
                    #cancelToken: cancelToken,
                    #deleteOnError: deleteOnError,
                    #lengthHeader: lengthHeader,
                    #data: data,
                    #options: options
                  })))) as _i9.Future<_i7.Response<dynamic>>);
  @override
  _i9.Future<_i7.Response<dynamic>> downloadUri(Uri? uri, dynamic savePath,
          {_i3.ProgressCallback? onReceiveProgress,
          _i11.CancelToken? cancelToken,
          bool? deleteOnError = true,
          String? lengthHeader = r'content-length',
          dynamic data,
          _i3.Options? options}) =>
      (super.noSuchMethod(
          Invocation.method(#downloadUri, [
            uri,
            savePath
          ], {
            #onReceiveProgress: onReceiveProgress,
            #cancelToken: cancelToken,
            #deleteOnError: deleteOnError,
            #lengthHeader: lengthHeader,
            #data: data,
            #options: options
          }),
          returnValue:
              _i9.Future<_i7.Response<dynamic>>.value(_FakeResponse_10<dynamic>(
                  this,
                  Invocation.method(#downloadUri, [
                    uri,
                    savePath
                  ], {
                    #onReceiveProgress: onReceiveProgress,
                    #cancelToken: cancelToken,
                    #deleteOnError: deleteOnError,
                    #lengthHeader: lengthHeader,
                    #data: data,
                    #options: options
                  })))) as _i9.Future<_i7.Response<dynamic>>);
  @override
  _i9.Future<_i7.Response<T>> request<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i11.CancelToken? cancelToken,
          _i3.Options? options,
          _i3.ProgressCallback? onSendProgress,
          _i3.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
          Invocation.method(#request, [
            path
          ], {
            #data: data,
            #queryParameters: queryParameters,
            #cancelToken: cancelToken,
            #options: options,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress
          }),
          returnValue: _i9.Future<_i7.Response<T>>.value(_FakeResponse_10<T>(
              this,
              Invocation.method(#request, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #cancelToken: cancelToken,
                #options: options,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              })))) as _i9.Future<_i7.Response<T>>);
  @override
  _i9.Future<_i7.Response<T>> requestUri<T>(Uri? uri,
          {dynamic data,
          _i11.CancelToken? cancelToken,
          _i3.Options? options,
          _i3.ProgressCallback? onSendProgress,
          _i3.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
          Invocation.method(#requestUri, [
            uri
          ], {
            #data: data,
            #cancelToken: cancelToken,
            #options: options,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress
          }),
          returnValue: _i9.Future<_i7.Response<T>>.value(_FakeResponse_10<T>(
              this,
              Invocation.method(#requestUri, [
                uri
              ], {
                #data: data,
                #cancelToken: cancelToken,
                #options: options,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              })))) as _i9.Future<_i7.Response<T>>);
  @override
  _i9.Future<_i7.Response<T>> fetch<T>(_i3.RequestOptions? requestOptions) =>
      (super.noSuchMethod(Invocation.method(#fetch, [requestOptions]),
          returnValue: _i9.Future<_i7.Response<T>>.value(_FakeResponse_10<T>(
              this, Invocation.method(#fetch, [requestOptions])))) as _i9
          .Future<_i7.Response<T>>);
}

/// A class which mocks [Response].
///
/// See the documentation for Mockito's code generation for more information.
class MockResponse<T> extends _i1.Mock implements _i7.Response<T> {
  MockResponse() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set data(T? _data) => super.noSuchMethod(Invocation.setter(#data, _data),
      returnValueForMissingStub: null);
  @override
  _i8.Headers get headers => (super.noSuchMethod(Invocation.getter(#headers),
          returnValue: _FakeHeaders_11(this, Invocation.getter(#headers)))
      as _i8.Headers);
  @override
  set headers(_i8.Headers? _headers) =>
      super.noSuchMethod(Invocation.setter(#headers, _headers),
          returnValueForMissingStub: null);
  @override
  _i3.RequestOptions get requestOptions => (super.noSuchMethod(
          Invocation.getter(#requestOptions),
          returnValue:
              _FakeRequestOptions_12(this, Invocation.getter(#requestOptions)))
      as _i3.RequestOptions);
  @override
  set requestOptions(_i3.RequestOptions? _requestOptions) =>
      super.noSuchMethod(Invocation.setter(#requestOptions, _requestOptions),
          returnValueForMissingStub: null);
  @override
  set statusCode(int? _statusCode) =>
      super.noSuchMethod(Invocation.setter(#statusCode, _statusCode),
          returnValueForMissingStub: null);
  @override
  set statusMessage(String? _statusMessage) =>
      super.noSuchMethod(Invocation.setter(#statusMessage, _statusMessage),
          returnValueForMissingStub: null);
  @override
  Map<String, dynamic> get extra =>
      (super.noSuchMethod(Invocation.getter(#extra),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
  @override
  set extra(Map<String, dynamic>? _extra) =>
      super.noSuchMethod(Invocation.setter(#extra, _extra),
          returnValueForMissingStub: null);
  @override
  List<_i12.RedirectRecord> get redirects =>
      (super.noSuchMethod(Invocation.getter(#redirects),
          returnValue: <_i12.RedirectRecord>[]) as List<_i12.RedirectRecord>);
  @override
  set redirects(List<_i12.RedirectRecord>? _redirects) =>
      super.noSuchMethod(Invocation.setter(#redirects, _redirects),
          returnValueForMissingStub: null);
  @override
  set isRedirect(bool? _isRedirect) =>
      super.noSuchMethod(Invocation.setter(#isRedirect, _isRedirect),
          returnValueForMissingStub: null);
  @override
  Uri get realUri => (super.noSuchMethod(Invocation.getter(#realUri),
      returnValue: _FakeUri_13(this, Invocation.getter(#realUri))) as Uri);
}
