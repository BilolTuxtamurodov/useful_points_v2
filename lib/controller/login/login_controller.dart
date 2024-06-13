import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:usefulpoints/controller/base/base_controller.dart';
import 'package:usefulpoints/data/storage/auth/auth_prefs.dart';
import 'package:usefulpoints/data/tools/enums/auth_result.dart';

class LoginController extends BaseController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future<void> logOut() async {
    await GoogleSignIn().signOut();
  }

  Future<AuthResult> loginWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final signInAccount = await googleSignIn.signIn();
    if (signInAccount == null) {
      return AuthResult.aborted;
    }

    emailController.text = signInAccount.email;
    Get.find<AuthPrefs>().email = signInAccount.email;

    GoogleSignInAuthentication googleAuth = await signInAccount.authentication;
    Get.find<AuthPrefs>().accessToken = googleAuth.accessToken??'';
    Get.find<AuthPrefs>().idToken = googleAuth.idToken??'';

    return AuthResult.success;

  }

  Future<void> loginWithEmail() async {

  }
}