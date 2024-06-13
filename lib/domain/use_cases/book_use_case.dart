import 'package:rxdart/rxdart.dart';
import 'package:usefulpoints/data/server/api/api_service.dart';
import 'package:usefulpoints/data/server/error_parser.dart';
import 'package:usefulpoints/domain/data/result/result.dart';
import 'package:usefulpoints/domain/entities/book/book_response.dart';

class BookUseCase {
  final ApiService _service;

  BookUseCase(this._service);

  Stream<Result<BookResponse>> getBook(int offset, int limit, String lang) => _service
      .getBook(offset, limit, lang)
      .map((response) {
    return Result.content(response);
  })
      .onErrorReturnWith(
          (error, stackTrace) => Result.error(ErrorParser.parse(error)))
      .startWith(const Result.loading());

}
