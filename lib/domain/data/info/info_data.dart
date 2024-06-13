
import 'package:freezed_annotation/freezed_annotation.dart';

part 'info_data.g.dart';

@JsonSerializable()
class InfoData {
  int? id;
  String? youtube;
  String? content;

  InfoData(this.id, this.youtube, this.content);

  factory InfoData.fromJson(Map<String, dynamic> json) =>
      _$InfoDataFromJson(json);

  Map<String, dynamic> toJson() => _$InfoDataToJson(this);
}


