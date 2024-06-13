import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';

class TextStyleItem extends StatelessWidget {
  final String title;
  final bool current;
  final TextStyle textStyle;
  const TextStyleItem({super.key, required this.title, required this.current, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      height: 40.h,
      width: 80.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: current ? Border.all(color: AppColors.orangeButtonColor) : null,
        color: AppColors.orangeVeryLight,
      ),
      child: Text(title, style: textStyle,),
    );
  }
}
