import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_request.g.dart';

@JsonSerializable()
class RegistrationRequest {
  String? full_name;
  String? password;
  String? email;

  RegistrationRequest(this.full_name, this.password, this.email);

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$RegistrationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationRequestToJson(this);
}
