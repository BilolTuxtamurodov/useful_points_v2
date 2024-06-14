import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:usefulpoints/controller/app_info/app_info_controller.dart';
import 'package:usefulpoints/controller/app_mode/app_mode_controller.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/tools/constants/images.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/domain/data/info/info_data.dart';
import 'package:usefulpoints/domain/use_cases/app_info_use_case.dart';
import 'package:usefulpoints/views/pages/app_mode/widget/app_mode_item.dart';
import 'package:usefulpoints/views/widgets/custom_app_bar.dart';
import 'package:usefulpoints/views/widgets/custom_button.dart';
import 'package:usefulpoints/views/widgets/no_internet_widget.dart';

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({super.key});

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder(
        init: AppInfoController(Get.find()),
        builder: (controller) {
          return Scaffold(
            appBar: CustomAppBar(title: Words.appAbout.tr,),
            body: SingleChildScrollView(
              child: SizedBox(
                  height: size.height - 85.h,
                  child: Stack(
                    children: [
                      if (controller.isLoading) const Center(child: CircularProgressIndicator(color: AppColors.orangeButtonColor,)),
                      if (controller.noInternet) Stack(
                        children: [
                          const NoInternet(),
                          Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: InkWell(
                                onTap: () => controller.onRefresh(),
                                child: CustomButton(
                                  title: Words.tryAgain.tr,
                                ),
                              )
                          ),
                        ],
                      ),
                      ListView.builder(
                          controller: controller.scrollController,
                          shrinkWrap: true,
                          itemCount: controller.infos.length,
                          itemBuilder: (context, index) {
                            InfoData data = controller.infos[index];
                            return Container(
                              padding: EdgeInsets.all(5.r),
                              child: HtmlWidget(
                                  data.content??''
                              ),
                            );
                          }
                      )
                      ],
                  )
              ),
            ),
          );
        }
    );
  }
}
