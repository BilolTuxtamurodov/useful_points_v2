import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:usefulpoints/data/server/auth_interceptor.dart';
import 'package:usefulpoints/domain/entities/book/book_response.dart';
import 'package:usefulpoints/domain/entities/info/card_info_response.dart';
import 'package:usefulpoints/domain/entities/info/info_response.dart';
import 'package:usefulpoints/domain/entities/login/login_request.dart';
import 'package:usefulpoints/domain/entities/login/login_response.dart';

import 'api_constant.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(AuthInterceptor authInterceptor) {
    var options = BaseOptions(
        connectTimeout: ApiConst.CONNECTION_TIME,
        sendTimeout: ApiConst.SEND_TIME_OUT,
        baseUrl: ApiConst.Base_URl,
        // headers: Get.find<AuthHolder>().authToken.isNotEmpty ? ApiConst.HEADERS : ApiConst.HEADERS_V2);
        // headers: ApiConst.HEADERS
    );
    Dio dio = Dio(options);
    dio.interceptors
      ..add(authInterceptor)
      ..add(LogInterceptor(requestBody: true, responseBody: true));

    return _ApiService(dio);
  }

  //auth
  @POST(ApiConst.LOGIN)
  Stream<LoginResponse> login(@Body() LoginRequest request);

  // book
  @GET(ApiConst.BOOK)
  Stream<BookResponse> getBook(@Query('offset') int offset, @Query('limit') int limit, @Header('Accept-Language') String lang);

  // info
  @GET(ApiConst.INFO)
  Stream<InfoResponse> getAppInfo(@Query('offset') int offset, @Query('limit') int limit, @Header('Accept-Language') String lang);

  @GET(ApiConst.CARD_INFO)
  Stream<CardInfoResponse> getCardInfo(@Query('offset') int offset, @Query('limit') int limit, @Header('Accept-Language') String lang);



}
