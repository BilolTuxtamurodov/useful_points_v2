import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Color titleColor;
  final EdgeInsets margin;
  final String icon;
  final Color? iconColor;
  final Border? border;
  const CustomButton({super.key, required this.title, this.buttonColor = AppColors.orangeButtonColor, this.titleColor = AppColors.white, this.margin = const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10), this.icon = '', this.border, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin.r,
      height: 56.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: buttonColor,
        border: border,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon.isNotEmpty ? Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: SvgPicture.asset(icon, color: iconColor,),
          ) : const SizedBox.shrink(),
          Text(title, style: robotoMedium.displayMedium?.copyWith(color: titleColor),),
        ],
      ),
    );
  }
}
