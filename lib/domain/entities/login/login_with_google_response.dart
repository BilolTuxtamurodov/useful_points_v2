
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_with_google_response.g.dart';

@JsonSerializable()
class LoginWithGoogleResponse {
  String? access_token;
  String? code;
  String? id_tokent;

  LoginWithGoogleResponse(this.access_token, this.code, this.id_tokent);

  factory LoginWithGoogleResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginWithGoogleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginWithGoogleResponseToJson(this);
}


