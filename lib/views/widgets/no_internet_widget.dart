import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/tools/constants/images.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(CustomImages.noInternetIcon, color: Theme.of(context).colorScheme.primary,),
            SizedBox(height: 10.h,),
            Text(Words.youAreOffline.tr, style: robotoBold.displayLarge?.copyWith(fontSize: 20.sp),),
            SizedBox(height: 10.h,),
            Text(Words.checkInternet.tr),
          ],
        )
    );
  }
}
