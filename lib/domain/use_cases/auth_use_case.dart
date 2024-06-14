import 'package:rxdart/rxdart.dart';
import 'package:usefulpoints/data/server/api/api_service.dart';
import 'package:usefulpoints/data/server/error_parser.dart';
import 'package:usefulpoints/domain/data/result/result.dart';
import 'package:usefulpoints/domain/entities/book/book_response.dart';
import 'package:usefulpoints/domain/entities/login/login_request.dart';
import 'package:usefulpoints/domain/entities/login/login_response.dart';
import 'package:usefulpoints/domain/entities/login/login_with_google_request.dart';
import 'package:usefulpoints/domain/entities/login/login_with_google_response.dart';
import 'package:usefulpoints/domain/entities/registration/activate_request.dart';
import 'package:usefulpoints/domain/entities/registration/activate_response.dart';
import 'package:usefulpoints/domain/entities/registration/registration_request.dart';
import 'package:usefulpoints/domain/entities/registration/registration_response.dart';
import 'package:usefulpoints/domain/entities/user/reset_password_confirm_request.dart';
import 'package:usefulpoints/domain/entities/user/reset_password_request.dart';
import 'package:usefulpoints/domain/entities/user/reset_password_response.dart';

class AuthUseCase {
  final ApiService _service;

  AuthUseCase(this._service);

  Stream<Result<LoginResponse>> login(LoginRequest request) => _service
      .login(request)
      .map((response) {
    return Result.content(response);
  })
      .onErrorReturnWith(
          (error, stackTrace) => Result.error(ErrorParser.parse(error)))
      .startWith(const Result.loading());

  Stream<Result<LoginWithGoogleResponse>> loginWithGoogle(LoginWithGoogleRequest request) => _service
      .loginWithGoogle(request)
      .map((response) {
    return Result.content(response);
  })
      .onErrorReturnWith(
          (error, stackTrace) => Result.error(ErrorParser.parse(error)))
      .startWith(const Result.loading());

  Stream<Result<ActivateResponse>> activate(ActivateRequest request) => _service
      .activate(request)
      .map((response) {
    return Result.content(response);
  })
      .onErrorReturnWith(
          (error, stackTrace) => Result.error(ErrorParser.parse(error)))
      .startWith(const Result.loading());

  Stream<Result<RegistrationResponse>> registration(RegistrationRequest request) => _service
      .registration(request)
      .map((response) {
    return Result.content(response);
  })
      .onErrorReturnWith(
          (error, stackTrace) => Result.error(ErrorParser.parse(error)))
      .startWith(const Result.loading());

  Stream<Result<ResetPasswordResponse>> resetPassword(ResetPasswordRequest request) => _service
      .resetPassword(request)
      .map((response) {
    return Result.content(response);
  })
      .onErrorReturnWith(
          (error, stackTrace) => Result.error(ErrorParser.parse(error)))
      .startWith(const Result.loading());

  Stream<Result<ResetPasswordConfirmRequest>> resetPasswordConfirm(ResetPasswordConfirmRequest request) => _service
      .resetPasswordConfirm(request)
      .map((response) {
    return Result.content(response);
  })
      .onErrorReturnWith(
          (error, stackTrace) => Result.error(ErrorParser.parse(error)))
      .startWith(const Result.loading());

}
