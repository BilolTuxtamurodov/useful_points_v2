// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranslateData _$TranslateDataFromJson(Map<String, dynamic> json) =>
    TranslateData(
      json['uz'] == null
          ? null
          : LanguageData.fromJson(json['uz'] as Map<String, dynamic>),
      json['ru'] == null
          ? null
          : LanguageData.fromJson(json['ru'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TranslateDataToJson(TranslateData instance) =>
    <String, dynamic>{
      'uz': instance.uz,
      'ru': instance.ru,
    };
