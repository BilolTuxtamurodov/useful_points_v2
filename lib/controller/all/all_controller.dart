import 'package:get/get.dart';
import 'package:usefulpoints/controller/base/base_controller.dart';
import 'package:usefulpoints/views/pages/app_info/about_app_page.dart';
import 'package:usefulpoints/views/pages/app_mode/app_mode_page.dart';
import 'package:usefulpoints/views/pages/choose_lang/choose_lang_page.dart';
import 'package:usefulpoints/views/pages/login/login_page.dart';
import 'package:usefulpoints/views/pages/video_guid/video_guide_page.dart';

class AllController extends BaseController {

  AllController();

  static void goToAppModePage() {
    Get.to(const AppModePage(), transition: Transition.rightToLeft);
  }

  static void goToChooseLanguagePage() {
    Get.to(const ChooseLangPage(isFirstPage: false,), transition: Transition.rightToLeft);
  }

  static void goToAboutPage() {
    Get.to(const AboutAppPage(), transition: Transition.rightToLeft);
  }

  static void goToVideGuidePage() {
    Get.to(const VideoGuidePage(isFirstPage: false,), transition: Transition.rightToLeft);
  }

  static void goToLoginPage() {
    Get.to(const LoginPage(), transition: Transition.rightToLeft);
  }
}