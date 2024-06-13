
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:usefulpoints/domain/data/book/translate_data.dart';

part 'book_data.g.dart';

@JsonSerializable()
class BookData {
  TranslateData? translate;
  int? order;
  bool? is_free;
  BookData(this.translate, this.order, this.is_free);

  factory BookData.fromJson(Map<String, dynamic> json) =>
      _$BookDataFromJson(json);

  Map<String, dynamic> toJson() => _$BookDataToJson(this);

  @override
  String toString() {
    return 'BookData{translate: $translate, order: $order, is_free: $is_free}';
  }
}


