import 'package:rxdart/rxdart.dart';
import 'package:usefulpoints/data/server/api/api_service.dart';
import 'package:usefulpoints/data/server/error_parser.dart';
import 'package:usefulpoints/domain/data/result/result.dart';
import 'package:usefulpoints/domain/entities/info/card_info_response.dart';
import 'package:usefulpoints/domain/entities/info/info_response.dart';

class AppInfoUseCase {
  final ApiService _service;

  AppInfoUseCase(this._service);

  Stream<Result<InfoResponse>> getAppInfo(int offset, int limit, String lang) => _service
      .getAppInfo(offset, limit, lang)
      .map((response) {
    return Result.content(response);
  })
      .onErrorReturnWith(
          (error, stackTrace) => Result.error(ErrorParser.parse(error)))
      .startWith(const Result.loading());

  Stream<Result<CardInfoResponse>> getCardInfo(int offset, int limit, String lang) => _service
      .getCardInfo(offset, limit, lang)
      .map((response) {
    return Result.content(response);
  })
      .onErrorReturnWith(
          (error, stackTrace) => Result.error(ErrorParser.parse(error)))
      .startWith(const Result.loading());

}
