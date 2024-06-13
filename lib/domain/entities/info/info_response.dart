
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:usefulpoints/domain/data/info/info_data.dart';

part 'info_response.g.dart';

@JsonSerializable()
class InfoResponse {
  int? count;
  String? next;
  String? previous;
  List<InfoData>? results;

  InfoResponse(this.count, this.next, this.previous, this.results);

  factory InfoResponse.fromJson(Map<String, dynamic> json) =>
      _$InfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InfoResponseToJson(this);
}


