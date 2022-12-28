import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_params.freezed.dart';

@freezed
class ServiceParams with _$ServiceParams {
  const factory ServiceParams({
    required String domain,
    required String service,
    required String entityId,
    int? brightness,
  }) = _ServiceParams;
  const ServiceParams._();
}
