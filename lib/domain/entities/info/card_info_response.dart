
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:usefulpoints/domain/data/card/card_data.dart';

part 'card_info_response.g.dart';

@JsonSerializable()
class CardInfoResponse {
  int? count;
  String? next;
  String? previous;
  List<CardData>? results;

  CardInfoResponse(this.count, this.next, this.previous, this.results);

  factory CardInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$CardInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CardInfoResponseToJson(this);
}


