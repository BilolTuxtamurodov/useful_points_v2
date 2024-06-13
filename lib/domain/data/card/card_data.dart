
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_data.g.dart';

@JsonSerializable()
class CardData {
  int? id;
  String? card;
  String? owner_name;

  CardData(this.id, this.card, this.owner_name);

  factory CardData.fromJson(Map<String, dynamic> json) =>
      _$CardDataFromJson(json);

  Map<String, dynamic> toJson() => _$CardDataToJson(this);
}


