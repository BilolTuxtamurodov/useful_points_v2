// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoData _$InfoDataFromJson(Map<String, dynamic> json) => InfoData(
      (json['id'] as num?)?.toInt(),
      json['youtube'] as String?,
      json['content'] as String?,
    );

Map<String, dynamic> _$InfoDataToJson(InfoData instance) => <String, dynamic>{
      'id': instance.id,
      'youtube': instance.youtube,
      'content': instance.content,
    };
