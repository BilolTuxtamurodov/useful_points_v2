import 'package:get/get.dart';
import 'package:usefulpoints/data/server/api/api_service.dart';
import 'package:usefulpoints/data/server/auth_interceptor.dart';
import 'package:usefulpoints/data/storage/app/locals/app_mode_pref/app_mode_pref.dart';
import 'package:usefulpoints/data/storage/app/locals/lang_prefs/language_prefs.dart';
import 'package:usefulpoints/data/storage/auth/auth_prefs.dart';
import 'package:usefulpoints/data/storage/auth/holder.dart';
import 'package:usefulpoints/domain/use_cases/app_info_use_case.dart';
import 'package:usefulpoints/domain/use_cases/book_use_case.dart';

class DIService {
  static Future<void> init () async {
    // pref
    Get.lazyPut<LangPrefs>(() => LangPrefs(), fenix: true);
    Get.lazyPut<AuthPrefs>(() => AuthPrefs(), fenix: true);
    Get.lazyPut<Holder>(() => AuthPrefs(), fenix: true);
    Get.lazyPut<ModePrefs>(() => ModePrefs(), fenix: true);

    Get.lazyPut<ApiService>(() => ApiService(Get.find<AuthInterceptor>()));
    Get.lazyPut<AuthInterceptor>(() => AuthInterceptor(Get.find<Holder>()));

    Get.lazyPut<BookUseCase>(() => BookUseCase(Get.find()), fenix: true);
    Get.lazyPut<AppInfoUseCase>(() => AppInfoUseCase(Get.find()), fenix: true);
  }
}