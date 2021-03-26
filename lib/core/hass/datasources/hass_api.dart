import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'hass_api.g.dart';

@RestApi()
abstract class HassApi {
  factory HassApi(Dio dio, {String baseUrl}) = _HassApi;

  @GET("/")
  Future<HttpResponse> checkHealth();

  @GET("/discovery_info")
  Future<HttpResponse> discoveryInfo();
}
