
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_data.g.dart';

@JsonSerializable()
class LanguageData {
  String? title;
  String? context;

  LanguageData(this.title, this.context);

  factory LanguageData.fromJson(Map<String, dynamic> json) =>
      _$LanguageDataFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageDataToJson(this);

  @override
  String toString() {
    return 'LanguageData{title: $title, context: $context}';
  }
}


