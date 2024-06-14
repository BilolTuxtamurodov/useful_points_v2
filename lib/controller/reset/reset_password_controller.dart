import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:rxdart/rxdart.dart';
import 'package:usefulpoints/controller/base/base_controller.dart';
import 'package:usefulpoints/data/storage/app/locals/error_words.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/storage/auth/auth_prefs.dart';
import 'package:usefulpoints/data/tools/enums/auth_result.dart';
import 'package:usefulpoints/data/tools/service/connectivity_service/connection.dart';
import 'package:usefulpoints/domain/entities/user/reset_password_confirm_request.dart';
import 'package:usefulpoints/domain/entities/user/reset_password_request.dart';
import 'package:usefulpoints/domain/use_cases/auth_use_case.dart';
import 'package:usefulpoints/views/pages/book/book_page.dart';
import 'package:usefulpoints/views/pages/reset/reset_password_confirm_page.dart';
import 'package:usefulpoints/views/widgets/top_snack_bar.dart';

class ResetPasswordController extends BaseController {
  bool isLoading = false;
  OtpFieldController otpController = OtpFieldController();
  TextEditingController smsCodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController prePasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthUseCase authUseCase;

  ResetPasswordController(this.authUseCase);

  Future<AuthResult> resetPassword() async {
    if (await CheckNet().checkInternet() == false) {

      return AuthResult.noInternet;
    }

    ResetPasswordRequest request = ResetPasswordRequest(emailController.text);

    authUseCase.resetPassword(request).listen((event) {
      event.when(
          loading: () {
            isLoading = true;
            update();
          },
          content: (content) {
            showGetSnackBar(title: Words.success.tr,);
            Get.find<AuthPrefs>().email = emailController.text;
            Get.offAll(const ResetPasswordConfirmPage(), transition: Transition.rightToLeft);
            update();
          },
          error: (error) => showGetSnackBar(title: ErrorWords.unKnownError.tr ,subtitle: '$error', isError: true, ));
    })
      ..onDone(() {
        isLoading = false;
        update();
      })
      ..addTo(subscribe);
    return AuthResult.success;
  }

  Future<AuthResult> resetPasswordConfirm() async {
    if (await CheckNet().checkInternet() == false) {

      return AuthResult.noInternet;
    }
    if (smsCodeController.text.length < 6) {
      showGetSnackBar(title: ErrorWords.badRequest.tr, subtitle: Words.allFieldsRequired.tr);
      return AuthResult.failure;
    }

    ResetPasswordConfirmRequest request = ResetPasswordConfirmRequest(Get.find<AuthPrefs>().email, smsCodeController.text, passwordController.text, prePasswordController.text);

    authUseCase.resetPasswordConfirm(request).listen((event) {
      event.when(
          loading: () {
            isLoading = true;
            update();
          },
          content: (content) {
            Get.find<AuthPrefs>().email = emailController.text;
            showGetSnackBar(title: Words.success.tr,);
            Get.offAll(const BookPage(), transition: Transition.rightToLeft);
            update();
          },
          error: (error) => showGetSnackBar(title: ErrorWords.unKnownError.tr ,subtitle: '$error', isError: true, ));
    })
      ..onDone(() {
        isLoading = false;
        update();
      })
      ..addTo(subscribe);
    return AuthResult.success;
  }

}