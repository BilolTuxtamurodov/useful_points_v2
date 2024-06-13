
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_response.g.dart';

@JsonSerializable()
class RegistrationResponse {
  String? full_name;
  String? email;

  RegistrationResponse(this.full_name, this.email);

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) =>
      _$RegistrationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationResponseToJson(this);
}


