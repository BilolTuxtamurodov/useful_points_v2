// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentUserResponse _$CurrentUserResponseFromJson(Map<String, dynamic> json) =>
    CurrentUserResponse(
      (json['id'] as num?)?.toInt(),
      json['email'] as String?,
      json['full_name'] as String?,
      json['is_premium'] as bool?,
    );

Map<String, dynamic> _$CurrentUserResponseToJson(
        CurrentUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'full_name': instance.full_name,
      'is_premium': instance.is_premium,
    };
