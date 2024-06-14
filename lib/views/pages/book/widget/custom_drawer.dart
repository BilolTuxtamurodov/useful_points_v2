import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:usefulpoints/controller/book/book_controller.dart';
import 'package:usefulpoints/data/storage/app/locals/app_mode_pref/app_mode_pref.dart';
import 'package:usefulpoints/data/storage/app/locals/lang_prefs/language_prefs.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/storage/auth/auth_prefs.dart';
import 'package:usefulpoints/data/tools/constants/images.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/views/widgets/custom_button.dart';
import 'package:usefulpoints/views/widgets/drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  final BookController controller;
  const CustomDrawer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .85,
      height: size.height,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 15.w, right: 15.w, bottom: 10.h),
            child: SvgPicture.asset(Get.find<ModePrefs>().appMode ? CustomImages.appLogo : CustomImages.appLogoDark),
          ),
          InkWell(
            onTap: () => controller.goToLoginPage(),
            child: CustomButton(title: Words.loginToProfile.tr, icon: CustomImages.userCircleIcon,),
          ),
          InkWell(
            onTap: () => controller.goToAppModePage(),
            child: DrawerItem(logo: CustomImages.modeIcon, title: Words.appMode.tr),
          ),
          InkWell(
            onTap: () => controller.goToChooseLanguagePage(),
            child: DrawerItem(logo: CustomImages.getFlag(Get.find<LangPrefs>().lang), title: Words.appLanguage.tr, suffixTitle: Get.find<LangPrefs>().lang.tr, isFlag: true,),
          ),
          InkWell(
            onTap: () => controller.goToAboutPage(),
            child: DrawerItem(logo: CustomImages.infoIcon, title: Words.appAbout.tr),
          ),
          InkWell(
            onTap: () => controller.goToVideGuidePage(),
            child: DrawerItem(logo: CustomImages.playIcon, title: Words.appGuide.tr, withBorder: Get.find<AuthPrefs>().logged,),
          ),
          Visibility(
            visible: Get.find<AuthPrefs>().logged,
            child: InkWell(
              onTap: () => controller.confirmDialog(context),
              child: DrawerItem(logo: CustomImages.logOutIcon, title: Words.logOut.tr, withBorder: false, titleColor: AppColors.redDark, iconColor: AppColors.redDark, isFlag: true,),
            ),
          )
        ],
      ),
    );
  }
}
