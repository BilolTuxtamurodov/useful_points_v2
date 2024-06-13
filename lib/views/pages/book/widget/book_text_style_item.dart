import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usefulpoints/data/tools/constants/images.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';

class BookTextStyleItem extends StatelessWidget {
  final bool current;
  final Color color;
  final Color titleColor;
  const BookTextStyleItem({super.key, required this.current, required this.color, required this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: color,
        border: current ? Border.all(color: AppColors.orangeButtonColor, width: 2.w) : null,
      ),
      height: 40.h,
      width: 100.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Aa', style: robotoRegular.displayMedium?.copyWith(color: titleColor),),
          SizedBox(width: 5.w,),
          Visibility(
            visible: current,
            child: SvgPicture.asset(CustomImages.checkIcon),
          ),
        ],
      ),
    );
  }
}
