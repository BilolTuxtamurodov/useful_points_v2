
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_confirm_request.g.dart';

@JsonSerializable()
class ResetPasswordConfirmRequest {
  String? email;
  String? activation_code;
  String? new_password;
  String? confirm_password;

  ResetPasswordConfirmRequest(this.email, this.activation_code, this.new_password, this.confirm_password);

  factory ResetPasswordConfirmRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordConfirmRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordConfirmRequestToJson(this);
}


