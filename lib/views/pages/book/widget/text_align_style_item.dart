import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';

class TextAlignStyleItem extends StatelessWidget {
  final String logo;
  final bool current;
  const TextAlignStyleItem({super.key, required this.logo, required this.current});

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
      child: SvgPicture.asset(logo, color: Theme.of(context).dividerColor,),
    );
  }
}
