import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usefulpoints/data/storage/app/locals/error_words.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';
import 'package:usefulpoints/views/widgets/top_snack_bar.dart';

void youTubeModal (BuildContext context, String url) {
  if (url.isNotEmpty) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) => Container(
          margin: EdgeInsets.symmetric(horizontal: 7.w),
          height: 200.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () async {
                  print('url : ${url}');

                  if (url.startsWith('http://') || url.startsWith('https://')) {
                    Uri youTube = Uri.parse(url);
                    if (await launchUrl(youTube)) {
                      //dialer opened
                    } else{
                      //dailer is not opened
                    }
                  } else {
                    Navigator.pop(context);
                    showGetSnackBar(title: ErrorWords.formatError.tr, isError: true, duration: const Duration(seconds: 5));
                  }
                  Navigator.pop(context);
                },
                child: Container(
                  height: 54.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color: AppColors.white,
                  ),
                  alignment: Alignment.center,
                  child: Text(Words.open.tr, style: robotoRegular.displaySmall?.copyWith(fontSize: 16.sp, color: AppColors.blue, fontWeight: FontWeight.w400)),
                ),
              ),
              SizedBox(height: 5.h,),
              InkWell(
                onTap: () => Navigator.pop(ctx),
                child: Container(
                  alignment: Alignment.center,
                  height: 54.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color: AppColors.white,
                  ),
                  child: Text(Words.cancel.tr, style: robotoRegular.displayMedium?.copyWith(color: AppColors.blue, fontSize: 16.sp, fontWeight: FontWeight.w400),),
                ),
              ),
              SizedBox(height: 30.h,),
            ],
          ),
        )
    );
  }

}