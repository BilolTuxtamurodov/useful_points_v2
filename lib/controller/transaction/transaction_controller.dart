import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';
import 'package:usefulpoints/controller/base/base_controller.dart';
import 'package:usefulpoints/data/storage/app/locals/error_words.dart';
import 'package:usefulpoints/data/storage/app/locals/lang_prefs/language_prefs.dart';
import 'package:usefulpoints/data/storage/auth/auth_prefs.dart';
import 'package:usefulpoints/data/tools/enums/auth_result.dart';
import 'package:usefulpoints/data/tools/enums/request_result.dart';
import 'package:usefulpoints/data/tools/service/connectivity_service/connection.dart';
import 'package:usefulpoints/domain/data/card/card_data.dart';
import 'package:usefulpoints/domain/use_cases/app_info_use_case.dart';
import 'package:usefulpoints/views/widgets/top_snack_bar.dart';

class TransactionController extends BaseController {
  bool isLoading = false;

  bool hasNextPage = false;
  int offset = 0;
  int limit = 5;
  List<CardData> cards = [];
  AppInfoUseCase appInfoUseCase;
  late ScrollController scrollController;

  TransactionController(this.appInfoUseCase);

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(getAppInfoMore);
    await getAppInfo();
    super.onInit();
  }

  @override
  dispose() async {
    scrollController.removeListener(getAppInfoMore);
    super.dispose();
  }

  void goToReadTheBook() {

  }

  void goToLoginToProfile() {

  }

  Future<RequestResult> getAppInfo() async {
    //#check internet connectivity
    if (await CheckNet().checkInternet() == false) {

      return RequestResult.noInternet;
    }
    //#check field completeness

    appInfoUseCase.getCardInfo(offset, limit, Get.find<LangPrefs>().lang).listen((event) {
      event.when(
          loading: () {
            isLoading = true;
            update();
          },
          content: (content) {
            cards = content.results ?? [];
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

  Future<RequestResult> getAppInfoMore() async {
    if (!hasNextPage) {
      return RequestResult.success;
    }
    //#check internet connectivity
    if (await CheckNet().checkInternet() == false) {

      return RequestResult.noInternet;
    }
    //#check field completeness
    offset += 1;
    appInfoUseCase.getCardInfo(offset, limit, Get.find<LangPrefs>().lang).listen((event) {
      event.when(
          loading: () {
            isLoading = true;
            update();
          },
          content: (content) {
            cards.addAll(content.results ?? []);
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


}