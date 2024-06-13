import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usefulpoints/controller/app_mode/app_mode_controller.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';

class AppModeItem extends StatelessWidget {
  final AppModeController controller;
  final String title;
  final String logo;
  final bool withBorder;
  final bool isAppMode;
  const AppModeItem({super.key, required this.controller, required this.title, required this.logo, this.withBorder = true, this.isAppMode = true});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        border: withBorder ? const Border(bottom: BorderSide(color: AppColors.greyLight, width: .8 )) : null,
      ),
      height: 56.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: size.width * .15,
                ),
                margin: EdgeInsets.only(right: 15.w),
                child: SvgPicture.asset(logo, color: Theme.of(context).dividerColor),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: size.width * .55,
                ),
                child: Text(title, style: robotoMedium.displayLarge,),
              ),
            ],
          ),
          CupertinoSwitch(
            trackColor: AppColors.blackLight,
            activeColor: AppColors.greenDark,
            value: isAppMode ? controller.appMode : controller.autoMode,
            onChanged: isAppMode ? (ss) => controller.changeAppMode(ss) : (ss) => controller.changeAutoMode(ss),
          ),
        ],
      ),
    );
  }
}
