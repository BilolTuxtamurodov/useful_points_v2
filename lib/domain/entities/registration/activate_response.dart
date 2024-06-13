
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activate_response.g.dart';

@JsonSerializable()
class ActivateResponse {
  String? email;

  ActivateResponse(this.email);

  factory ActivateResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ActivateResponseToJson(this);
}


