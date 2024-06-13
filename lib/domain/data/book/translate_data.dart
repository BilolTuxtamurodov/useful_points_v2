
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:usefulpoints/domain/data/book/language_data.dart';

part 'translate_data.g.dart';

@JsonSerializable()
class TranslateData {
  LanguageData? uz;
  LanguageData? ru;

  TranslateData(this.uz, this.ru);

  factory TranslateData.fromJson(Map<String, dynamic> json) =>
      _$TranslateDataFromJson(json);

  Map<String, dynamic> toJson() => _$TranslateDataToJson(this);

  @override
  String toString() {
    return 'TranslateData{uz: $uz, ru: $ru}';
  }
}


