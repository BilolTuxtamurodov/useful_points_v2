// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookData _$BookDataFromJson(Map<String, dynamic> json) => BookData(
      json['translate'] == null
          ? null
          : TranslateData.fromJson(json['translate'] as Map<String, dynamic>),
      (json['order'] as num?)?.toInt(),
      json['is_free'] as bool?,
    );

Map<String, dynamic> _$BookDataToJson(BookData instance) => <String, dynamic>{
      'translate': instance.translate,
      'order': instance.order,
      'is_free': instance.is_free,
    };
