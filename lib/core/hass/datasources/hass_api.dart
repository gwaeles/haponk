import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'hass_api.g.dart';

@RestApi()
abstract class HassApi {
  factory HassApi(Dio dio, {String baseUrl}) = _HassApi;

  @GET("/")
  Future<HttpResponse> checkHealth({
    @Header("Authorization") String? authorization,
  });

  @GET("/config")
  Future<HttpResponse> config({
    @Header("Authorization") String? authorization,
  });
}
