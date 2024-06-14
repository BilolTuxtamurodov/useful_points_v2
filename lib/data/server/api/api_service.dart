import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:usefulpoints/data/server/auth_interceptor.dart';
import 'package:usefulpoints/domain/entities/book/book_response.dart';
import 'package:usefulpoints/domain/entities/info/card_info_response.dart';
import 'package:usefulpoints/domain/entities/info/info_response.dart';
import 'package:usefulpoints/domain/entities/login/login_request.dart';
import 'package:usefulpoints/domain/entities/login/login_response.dart';
import 'package:usefulpoints/domain/entities/login/login_with_google_request.dart';
import 'package:usefulpoints/domain/entities/login/login_with_google_response.dart';
import 'package:usefulpoints/domain/entities/registration/activate_request.dart';
import 'package:usefulpoints/domain/entities/registration/activate_response.dart';
import 'package:usefulpoints/domain/entities/registration/registration_request.dart';
import 'package:usefulpoints/domain/entities/registration/registration_response.dart';
import 'package:usefulpoints/domain/entities/user/current_user_response.dart';
import 'package:usefulpoints/domain/entities/user/reset_password_confirm_request.dart';
import 'package:usefulpoints/domain/entities/user/reset_password_request.dart';
import 'package:usefulpoints/domain/entities/user/reset_password_response.dart';

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

  @POST(ApiConst.LOGIN_WITH_GOOGLE)
  Stream<LoginWithGoogleResponse> loginWithGoogle(@Body() LoginWithGoogleRequest request);

  @POST(ApiConst.REGISTER)
  Stream<RegistrationResponse> registration(@Body() RegistrationRequest request);

  @POST(ApiConst.ACTIVATE)
  Stream<ActivateResponse> activate(@Body() ActivateRequest request);

  @POST(ApiConst.RESET_PASSWORD)
  Stream<ResetPasswordResponse> resetPassword(@Body() ResetPasswordRequest request);

  @POST(ApiConst.RESET_PASSWORD_CONFIRM)
  Stream<ResetPasswordConfirmRequest> resetPasswordConfirm(@Body() ResetPasswordConfirmRequest request);

  // user
  @GET(ApiConst.GET_USER)
  Stream<CurrentUserResponse> getCurrentUser();

  // book
  @GET(ApiConst.BOOK)
  Stream<BookResponse> getBook(@Query('offset') int offset, @Query('limit') int limit, @Header('Accept-Language') String lang);

  // info
  @GET(ApiConst.INFO)
  Stream<InfoResponse> getAppInfo(@Query('offset') int offset, @Query('limit') int limit, @Header('Accept-Language') String lang);

  // card
  @GET(ApiConst.CARD_INFO)
  Stream<CardInfoResponse> getCardInfo(@Query('offset') int offset, @Query('limit') int limit, @Header('Accept-Language') String lang);



}
