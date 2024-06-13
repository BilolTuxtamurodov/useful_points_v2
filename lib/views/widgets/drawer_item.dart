import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usefulpoints/data/tools/constants/images.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';

class DrawerItem extends StatelessWidget {
  final String logo;
  final String title;
  final String suffixTitle;
  final bool withBorder;
  final bool isFlag;
  const DrawerItem({super.key, required this.logo, required this.title, this.suffixTitle = '', this.withBorder = true, this.isFlag = false});

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
                child: SvgPicture.asset(logo, color: !isFlag ? Theme.of(context).dividerColor : null),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: size.width * .55,
                ),
                child: Text(title, style: robotoMedium.displayLarge,),
              ),
            ],
          ),
          Text(suffixTitle, style: robotoMedium.displayLarge?.copyWith(color: Theme.of(context).hintColor),),
        ],
      ),
    );
  }
}
