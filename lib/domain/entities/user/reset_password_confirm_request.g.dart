// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_confirm_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordConfirmRequest _$ResetPasswordConfirmRequestFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordConfirmRequest(
      json['email'] as String?,
      json['activation_code'] as String?,
      json['new_password'] as String?,
      json['confirm_password'] as String?,
    );

Map<String, dynamic> _$ResetPasswordConfirmRequestToJson(
        ResetPasswordConfirmRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'activation_code': instance.activation_code,
      'new_password': instance.new_password,
      'confirm_password': instance.confirm_password,
    };
