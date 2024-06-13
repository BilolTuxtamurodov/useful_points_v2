
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:usefulpoints/domain/data/book/book_data.dart';

part 'book_response.g.dart';

@JsonSerializable()
class BookResponse {
  int? count;
  String? next;
  String? previous;
  List<BookData>? results;

  BookResponse(this.count, this.next, this.previous, this.results);

  factory BookResponse.fromJson(Map<String, dynamic> json) =>
      _$BookResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookResponseToJson(this);
}


