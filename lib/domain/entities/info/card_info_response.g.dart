// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardInfoResponse _$CardInfoResponseFromJson(Map<String, dynamic> json) =>
    CardInfoResponse(
      (json['count'] as num?)?.toInt(),
      json['next'] as String?,
      json['previous'] as String?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => CardData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CardInfoResponseToJson(CardInfoResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
