import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:usefulpoints/controller/app_info/app_info_controller.dart';
import 'package:usefulpoints/data/storage/app/locals/app_mode_pref/app_mode_pref.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/tools/constants/images.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';
import 'package:usefulpoints/domain/data/info/info_data.dart';
import 'package:usefulpoints/views/widgets/custom_app_bar.dart';
import 'package:usefulpoints/views/widgets/custom_button.dart';
import 'package:usefulpoints/views/widgets/you_tube_modal.dart';

class VideoGuidePage extends StatelessWidget {
  final bool isFirstPage;
  const VideoGuidePage({super.key, this.isFirstPage = true});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder(
        init: AppInfoController(Get.find()),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Get.find<ModePrefs>().appMode ? AppColors.orangeBackground : AppColors.backgroundColorDark,
            appBar: CustomAppBar(
              title: Words.videoGuide.tr,
              backgroundColor: Get.find<ModePrefs>().appMode ? AppColors.orangeBackground : AppColors.backgroundColorDark,
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: SizedBox(
                    height: size.height - 85,
                    child: Stack(
                      children: [
                        SvgPicture.asset(CustomImages.backgroundCircles, height: size.height * .80,),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.infos.length,
                          itemBuilder: (context, index) {
                            InfoData data = controller.infos[index];
                            return InkWell(
                              onTap: () => youTubeModal(context, data.youtube??''),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                                padding: EdgeInsets.all(10.r),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(CustomImages.videoImage),
                                    SizedBox(height: 5.h,),
                                    HtmlWidget(data.content??'', textStyle: robotoBold.displayLarge?.copyWith(fontSize: 18.sp),),
                                  ],
                                ),
                              ),
                            );
                          }),
                        Visibility(
                          visible: isFirstPage,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              const Spacer(),
                              InkWell(
                                onTap: () => controller.goToLoginToProfile(),
                                child: CustomButton(
                                  title: Words.loginToProfile.tr,
                                  titleColor: AppColors.black,
                                  buttonColor: AppColors.white,
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                ),
                              ),
                              InkWell(
                                onTap: () => controller.goToReadTheBook(),
                                child: CustomButton(
                                  title: Words.readBook.tr,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
