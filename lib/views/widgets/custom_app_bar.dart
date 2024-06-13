import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usefulpoints/data/tools/constants/images.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final bool hasAction;
  const CustomAppBar({super.key, required this.title, this.backgroundColor, this.hasAction = false});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: Text(title, style: robotoRegular.displayMedium?.copyWith(fontSize: 20.sp),),
      toolbarHeight: 60.h,
      actions: hasAction ? [
        InkWell(
          onTap: () => showBottomSheet(
            context: context,
            builder: (context) {
              return ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(5.r), topLeft: Radius.circular(5.r)),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor
                  ),
                  height: 300.h,
                  alignment: Alignment.center,
                  child: Text('Hello'),
                ),
              );
            }
          ),
          child: Container(
            margin: EdgeInsets.only(right: 15.w),
            child: SvgPicture.asset(CustomImages.settingsIcon, color: Theme.of(context).dividerColor,),),),
      ] : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
