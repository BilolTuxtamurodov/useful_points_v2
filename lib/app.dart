import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:usefulpoints/data/storage/app/locals/app_mode_pref/app_mode_pref.dart';
import 'package:usefulpoints/data/tools/service/lang_service/lang_service.dart';
import 'package:usefulpoints/data/tools/styles/app_mode.dart';
import 'package:usefulpoints/example.dart';
import 'package:usefulpoints/views/pages/app_mode/app_mode_page.dart';
import 'package:usefulpoints/views/pages/book/book_chapters_page.dart';
import 'package:usefulpoints/views/pages/book/book_page.dart';
import 'package:usefulpoints/views/pages/choose_lang/choose_lang_page.dart';
import 'package:usefulpoints/views/pages/login/login_page.dart';
import 'package:usefulpoints/views/pages/need/need_purchase_page.dart';
import 'package:usefulpoints/views/pages/registration/confirm_page.dart';
import 'package:usefulpoints/views/pages/reset/reset_password_confirm_page.dart';
import 'package:usefulpoints/views/pages/reset/reset_password_page.dart';
import 'package:usefulpoints/views/pages/transaction/transaction_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: LangService(),
          locale: LangService.defaultLanguage(),
          fallbackLocale: LangService.fallbackLocale,
          themeMode: Get.find<ModePrefs>().appMode == true
                ? ThemeMode.light
                : ThemeMode.dark,
          title: 'Foydali nuqtalar',
          darkTheme: MyCustomMode().darkTheme,
          theme: MyCustomMode().lightTheme,
          home: const ChooseLangPage()
        );
      },
    );
  }
}