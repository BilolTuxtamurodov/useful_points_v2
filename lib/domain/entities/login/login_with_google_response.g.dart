// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_with_google_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginWithGoogleResponse _$LoginWithGoogleResponseFromJson(
        Map<String, dynamic> json) =>
    LoginWithGoogleResponse(
      json['access_token'] as String?,
      json['code'] as String?,
      json['id_tokent'] as String?,
    );

Map<String, dynamic> _$LoginWithGoogleResponseToJson(
        LoginWithGoogleResponse instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'code': instance.code,
      'id_tokent': instance.id_tokent,
    };
