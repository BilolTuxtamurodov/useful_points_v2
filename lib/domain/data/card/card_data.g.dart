// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardData _$CardDataFromJson(Map<String, dynamic> json) => CardData(
      (json['id'] as num?)?.toInt(),
      json['card'] as String?,
      json['owner_name'] as String?,
    );

Map<String, dynamic> _$CardDataToJson(CardData instance) => <String, dynamic>{
      'id': instance.id,
      'card': instance.card,
      'owner_name': instance.owner_name,
    };
