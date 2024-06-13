// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activate_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivateRequest _$ActivateRequestFromJson(Map<String, dynamic> json) =>
    ActivateRequest(
      (json['activate_code'] as num?)?.toInt(),
      json['email'] as String?,
    );

Map<String, dynamic> _$ActivateRequestToJson(ActivateRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'activate_code': instance.activate_code,
    };
