import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:usefulpoints/controller/base/base_controller.dart';
import 'package:usefulpoints/data/storage/app/locals/app_mode_pref/app_mode_pref.dart';
import 'package:usefulpoints/data/storage/app/locals/error_words.dart';
import 'package:usefulpoints/data/storage/app/locals/lang_prefs/language_prefs.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/storage/auth/auth_prefs.dart';
import 'package:usefulpoints/data/tools/enums/book_mode.dart';
import 'package:usefulpoints/data/tools/enums/request_result.dart';
import 'package:usefulpoints/data/tools/enums/text_align_style.dart';
import 'package:usefulpoints/data/tools/service/connectivity_service/connection.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/data/tools/styles/app_mode.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';
import 'package:usefulpoints/domain/data/book/book_data.dart';
import 'package:usefulpoints/domain/use_cases/book_use_case.dart';
import 'package:usefulpoints/views/pages/app_info/about_app_page.dart';
import 'package:usefulpoints/views/pages/app_mode/app_mode_page.dart';
import 'package:usefulpoints/views/pages/book/book_chapters_page.dart';
import 'package:usefulpoints/views/pages/choose_lang/choose_lang_page.dart';
import 'package:usefulpoints/views/pages/login/login_page.dart';
import 'package:usefulpoints/views/pages/need/need_login_page.dart';
import 'package:usefulpoints/views/pages/need/need_purchase_page.dart';
import 'package:usefulpoints/views/pages/video_guid/video_guide_page.dart';
import 'package:usefulpoints/views/widgets/top_snack_bar.dart';

class BookController extends BaseController {
  bool isLoading = false;
  bool noInternet = false;
  bool hasNextPage = false;
  bool canShowModal = false;
  int offset = 0;
  int limit = 5;
  double fontSize = 18;
  TextAlignStyle currentAlignStyle = TextAlignStyle.left;
  late BookMode currentMode;

  List<BookData> books = [];
  BookUseCase bookUseCase;
  TextStyle currentTextStyle = robotoRegular.displayMedium!;
  late ScrollController scrollController;
  BookController(this.bookUseCase);

  Future<void> onRefresh() async {
    Future.delayed(const Duration(seconds: 1));
    await getBookFirst();
  }

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() {
      if (canShowModal) {
        canShowModal = false;
        update();
      }
      getBookMore();
    });
    if (Get.find<ModePrefs>().appMode) {
      currentMode = BookMode.white;
    } else {
      currentMode = BookMode.black;
    }
    await getBookFirst();
    super.onInit();
  }

  @override
  dispose() async {
    scrollController.removeListener(getBookMore);
    offset = 0;
    super.dispose();
  }

  Future<RequestResult> getBookFirst() async {
    //#check internet connectivity
    if (await CheckNet().checkInternet() == false) {
      noInternet = true;
      return RequestResult.noInternet;
    } else {
      noInternet = false;
    }
    //#check field completeness
    offset = 0;
    bookUseCase.getBook(offset, limit, Get.find<LangPrefs>().lang).listen((event) {
      event.when(
          loading: () {
            isLoading = true;
            update();
          },
          content: (content) {
            books = content.results ?? [];
            if (content.next != null && content.next!.isNotEmpty) {
              hasNextPage = true;
            } else {
              hasNextPage = false;
            }
            update();
          },
          error: (error) => showGetSnackBar(title: ErrorWords.unKnownError.tr ,subtitle: '$error', isError: true, ));
    })
      ..onDone(() {
        isLoading = false;
        update();
      })
      ..addTo(subscribe);
    return RequestResult.success;
  }

  Future<RequestResult> getBookMore() async {
    if (!hasNextPage) {
      return RequestResult.success;
    }
    //#check internet connectivity
    if (await CheckNet().checkInternet() == false) {
      noInternet = true;
      return RequestResult.noInternet;
    } else {
      noInternet = false;
    }
    //#check field completeness
    offset += 1;
    bookUseCase.getBook(offset, limit, Get.find<LangPrefs>().lang).listen((event) {
      event.when(
          loading: () {
            isLoading = true;
            update();
          },
          content: (content) {
            books.addAll(content.results ?? []);
            if (content.next != null && content.next!.isNotEmpty) {
              hasNextPage = true;
            } else {
              hasNextPage = false;
            }
            update();
          },
          error: (error) => showGetSnackBar(title: ErrorWords.unKnownError.tr ,subtitle: '$error', isError: true, ));
    })
      ..onDone(() {
        isLoading = false;
        update();
      })
      ..addTo(subscribe);
    return RequestResult.success;
  }

  void goToBookChaptersPage() {
    Get.to(const BookChaptersPage(), transition: Transition.rightToLeft);
  }

  ThemeData getMode() {
    switch(currentMode) {
      case BookMode.white : return MyCustomMode().lightTheme;
      case BookMode.black : return MyCustomMode().darkTheme;
      case BookMode.orange : return MyCustomMode().orangeTheme;
      default : return MyCustomMode().lightTheme;
    }
  }

  void changeMode(BookMode mode) {
    switch (mode) {
      case BookMode.white : {
        Get.changeThemeMode(ThemeMode.light);
        Get.find<ModePrefs>().appMode = true;
      }
      case BookMode.black : {
        Get.changeThemeMode(ThemeMode.dark);
        Get.find<ModePrefs>().appMode = false;
      }
      case BookMode.orange : {
        Get.changeThemeMode(ThemeMode.light);
        Get.find<ModePrefs>().appMode = true;
      }
    }
    currentMode = mode;
    update();
  }

  void changeSlider (double value) {
    fontSize = value;
    update();
  }

  void changeTextAlign(TextAlignStyle style) {
    currentAlignStyle = style;
    update();
  }

  void changeTextStyle(TextStyle style) {
    currentTextStyle = style;
    update();
  }

  TextAlign getTextAlign() {
    switch (currentAlignStyle) {
      case TextAlignStyle.left : return TextAlign.left;
      case TextAlignStyle.justify : return TextAlign.justify;
      default: return TextAlign.left;
    }
  }

  void showModal() {
    canShowModal = !canShowModal;
    update();
  }

  void goToNeedLoginPage() {
    Get.find<AuthPrefs>().logged ?
    Get.to(const NeedPurchasePage(), transition: Transition.rightToLeft)
    : Get.to(const NeedLoginPage(), transition: Transition.rightToLeft);
  }

  Future<void> goToAppModePage() async {
    var future = await Get.to(const AppModePage(), transition: Transition.rightToLeft);
    update();
  }

  void goToChooseLanguagePage() {
    Get.to(const ChooseLangPage(isFirstPage: false,), transition: Transition.rightToLeft);
  }

  void goToAboutPage() {
    Get.to(const AboutAppPage(), transition: Transition.rightToLeft);
  }

  void goToVideGuidePage() {
    Get.to(const VideoGuidePage(isFirstPage: false,), transition: Transition.rightToLeft);
  }

  void goToLoginPage() {
    Get.to(const LoginPage(), transition: Transition.rightToLeft);
  }

  Future<bool> confirmDialog(BuildContext context) async {
    final size = MediaQuery.of(context).size;
    final value = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
        actionsPadding: EdgeInsets.only(bottom: 20.w, right: 10.w, left: 10.w),
        title: Text(
          Words.wantLogOut.tr,
          style: robotoRegular.displayMedium,
          textAlign: TextAlign.center,
        ),
        content: SizedBox(
          width: size.width * .85,
          height: 50.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () async {
                  Navigator.of(context).pop(false);
                },
                child: Container(
                  width: size.width * .28,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(4.r)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  child: Text(
                    Words.cancel.tr,
                    style: robotoRegular.displaySmall,
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              InkWell(
                onTap: () async {
                  Navigator.of(context).pop(true);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: size.width * .38,
                  decoration: BoxDecoration(
                      color: AppColors.orangeButtonColor,
                      borderRadius: BorderRadius.circular(4.r)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  child: Text(
                    Words.logOut.tr,
                    style: robotoRegular.displaySmall?.copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),

              ),
            ],
          ),
        ),
      ),
    );

    return value!;
  }
}