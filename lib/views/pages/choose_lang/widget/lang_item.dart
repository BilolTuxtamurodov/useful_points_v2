import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usefulpoints/data/tools/constants/images.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';

class LangItem extends StatelessWidget {
  final bool isCurrent;
  final String title;
  final String logo;
  const LangItem({super.key, required this.isCurrent, required this.title, required this.logo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 20.w),
      height: 56.h,
      decoration: BoxDecoration(
          color: isCurrent ? AppColors.orangeLight08 : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(logo),
              SizedBox(
                width: 15.w,
              ),
              Text(title, style: isCurrent ? robotoBold.displayMedium : robotoRegular.displayMedium,),
            ],
          ),
          Visibility(
            visible: isCurrent,
            child: SvgPicture.asset(CustomImages.checkIcon)
          ),
        ],
      ),
    );
  }
}
