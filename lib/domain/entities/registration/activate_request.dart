import 'package:freezed_annotation/freezed_annotation.dart';

part 'activate_request.g.dart';

@JsonSerializable()
class ActivateRequest {
  String? email;
  int? activate_code;

  ActivateRequest(this.activate_code, this.email);

  factory ActivateRequest.fromJson(Map<String, dynamic> json) =>
      _$ActivateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ActivateRequestToJson(this);
}
