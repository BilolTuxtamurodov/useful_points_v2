import 'package:get/get.dart';
import 'package:usefulpoints/controller/base/base_controller.dart';
import 'package:usefulpoints/data/tools/service/lang_service/lang_service.dart';
import 'package:usefulpoints/views/pages/video_guid/video_guide_page.dart';

class ChooseLangController extends BaseController {
  late String currentLang;


  @override
  void onInit() async {
    currentLang = LangService.defaultLanguage().languageCode;
    super.onInit();
  }

  void changeLang (String lang) {
    currentLang = lang;
    update();
  }

  void continueAction() {
    LangService.changeLocale(currentLang);
    Get.offAll(const VideoGuidePage(), transition: Transition.rightToLeft);
  }

  void save() {
    LangService.changeLocale(currentLang);
    update();
  }
}