// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_with_google_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginWithGoogleRequest _$LoginWithGoogleRequestFromJson(
        Map<String, dynamic> json) =>
    LoginWithGoogleRequest(
      json['access_token'] as String?,
      json['code'] as String?,
      json['id_tokent'] as String?,
    );

Map<String, dynamic> _$LoginWithGoogleRequestToJson(
        LoginWithGoogleRequest instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'code': instance.code,
      'id_tokent': instance.id_tokent,
    };
