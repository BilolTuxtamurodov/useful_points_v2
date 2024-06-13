import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';
import 'package:usefulpoints/controller/base/base_controller.dart';
import 'package:usefulpoints/data/storage/app/locals/app_mode_pref/app_mode_pref.dart';
import 'package:usefulpoints/data/storage/app/locals/error_words.dart';
import 'package:usefulpoints/data/storage/app/locals/lang_prefs/language_prefs.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/storage/auth/auth_prefs.dart';
import 'package:usefulpoints/data/tools/enums/auth_result.dart';
import 'package:usefulpoints/data/tools/enums/request_result.dart';
import 'package:usefulpoints/data/tools/service/connectivity_service/connection.dart';
import 'package:usefulpoints/domain/data/book/book_data.dart';
import 'package:usefulpoints/domain/entities/book/book_response.dart';
import 'package:usefulpoints/domain/use_cases/book_use_case.dart';
import 'package:usefulpoints/views/widgets/top_snack_bar.dart';

class AppModeController extends BaseController {
  late bool appMode;
  late bool autoMode = false;

  AppModeController();

  @override
  void onInit() async {
    appMode = Get.find<ModePrefs>().appMode;
    super.onInit();
  }

  @override
  dispose() async {
    super.dispose();
  }

  void changeAppMode(bool b) {
    print(b);
    Get.changeThemeMode(b ? ThemeMode.light : ThemeMode.dark);
    appMode = b;
    Get.find<ModePrefs>().appMode = b;
    update();
  }

  void changeAutoMode(bool b) {
    autoMode = b;

    Get.find<AuthPrefs>().logged = b;
    showSnackBar(title: Words.autoModeNotWorking.tr, isError: true, );
    update();
  }

}