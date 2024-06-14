import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:rxdart/rxdart.dart';
import 'package:usefulpoints/controller/base/base_controller.dart';
import 'package:usefulpoints/data/storage/app/locals/error_words.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/storage/auth/auth_prefs.dart';
import 'package:usefulpoints/data/tools/enums/auth_result.dart';
import 'package:usefulpoints/data/tools/enums/request_result.dart';
import 'package:usefulpoints/data/tools/service/connectivity_service/connection.dart';
import 'package:usefulpoints/domain/entities/login/login_request.dart';
import 'package:usefulpoints/domain/entities/login/login_with_google_request.dart';
import 'package:usefulpoints/domain/entities/registration/activate_request.dart';
import 'package:usefulpoints/domain/entities/registration/registration_request.dart';
import 'package:usefulpoints/domain/use_cases/auth_use_case.dart';
import 'package:usefulpoints/views/pages/book/book_page.dart';
import 'package:usefulpoints/views/pages/login/login_page.dart';
import 'package:usefulpoints/views/pages/registration/confirm_page.dart';
import 'package:usefulpoints/views/widgets/top_snack_bar.dart';

import '../../views/pages/registration/registration_page.dart';

class LoginController extends BaseController {
  bool isLoading = false;
  OtpFieldController otpController = OtpFieldController();
  TextEditingController smsCodeController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthUseCase authUseCase;

  LoginController(this.authUseCase);

  Future<void> logOut() async {
    await GoogleSignIn().signOut();
  }

  Future<AuthResult> loginWithGoogle() async {
    if (await CheckNet().checkInternet() == false) {

      return AuthResult.noInternet;
    }

    final GoogleSignIn googleSignIn = GoogleSignIn();
    final signInAccount = await googleSignIn.signIn();
    if (signInAccount == null) {
      return AuthResult.aborted;
    }

    emailController.text = signInAccount.email;
    fullNameController.text = signInAccount.displayName??'';
    Get.find<AuthPrefs>().email = signInAccount.email;

    GoogleSignInAuthentication googleAuth = await signInAccount.authentication;
    Get.find<AuthPrefs>().accessToken = googleAuth.accessToken??'';
    Get.find<AuthPrefs>().idToken = googleAuth.idToken??'';
    Get.find<AuthPrefs>().code = signInAccount.serverAuthCode??'';

    LoginWithGoogleRequest request = LoginWithGoogleRequest(googleAuth.accessToken??'', signInAccount.serverAuthCode??'', googleAuth.idToken??'');
    authUseCase.loginWithGoogle(request).listen((event) {
      event.when(
          loading: () {
            isLoading = true;
            update();
          },
          content: (content) {
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

  Future<AuthResult> loginWithEmail() async {
    if (await CheckNet().checkInternet() == false) {

      return AuthResult.noInternet;
    }

    LoginRequest request = LoginRequest(passwordController.text, emailController.text);

    authUseCase.login(request).listen((event) {
      event.when(
          loading: () {
            isLoading = true;
            update();
          },
          content: (content) {
            showGetSnackBar(title: Words.success.tr,);
            Get.find<AuthPrefs>().email = emailController.text;
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

  Future<AuthResult> registration() async {
    if (await CheckNet().checkInternet() == false) {

      return AuthResult.noInternet;
    }


    RegistrationRequest request = RegistrationRequest(fullNameController.text, passwordController.text, emailController.text);

    authUseCase.registration(request).listen((event) {
      event.when(
          loading: () {
            isLoading = true;
            update();
          },
          content: (content) {
            Get.find<AuthPrefs>().email = emailController.text;
            showGetSnackBar(title: Words.success.tr,);
            Get.offAll(const ConfirmPage(), transition: Transition.rightToLeft);
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

  Future<AuthResult> activate() async {
    if (await CheckNet().checkInternet() == false) {

      return AuthResult.noInternet;
    }
    if (smsCodeController.text.length < 6) {
      showGetSnackBar(title: ErrorWords.badRequest.tr, subtitle: Words.allFieldsRequired.tr);
      return AuthResult.failure;
    }
    int code = int.tryParse(smsCodeController.text.numericOnly())??0;

    ActivateRequest request = ActivateRequest(code, Get.find<AuthPrefs>().email);

    authUseCase.activate(request).listen((event) {
      event.when(
          loading: () {
            isLoading = true;
            update();
          },
          content: (content) {
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

  void goToLoginPage() {
    Get.off(const LoginPage(), transition: Transition.rightToLeft);
  }

  void goToRegistrationPage() {
    Get.off(const RegistrationPage(), transition: Transition.rightToLeft);
  }
}