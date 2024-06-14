import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_with_google_request.g.dart';

@JsonSerializable()
class LoginWithGoogleRequest {
  String? access_token;
  String? code;
  String? id_tokent;

  LoginWithGoogleRequest(this.access_token, this.code, this.id_tokent);

  factory LoginWithGoogleRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginWithGoogleRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginWithGoogleRequestToJson(this);
}
