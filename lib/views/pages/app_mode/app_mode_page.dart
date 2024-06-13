import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:usefulpoints/controller/app_mode/app_mode_controller.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/tools/constants/images.dart';
import 'package:usefulpoints/views/pages/app_mode/widget/app_mode_item.dart';
import 'package:usefulpoints/views/widgets/custom_app_bar.dart';

class AppModePage extends StatefulWidget {
  const AppModePage({super.key});

  @override
  State<AppModePage> createState() => _AppModePageState();
}

class _AppModePageState extends State<AppModePage> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder(
        init: AppModeController(),
        builder: (controller) {
          return Scaffold(
            appBar: CustomAppBar(title: Words.appMode.tr,),
            body: SingleChildScrollView(
              child: SizedBox(
                height: size.height - 85.h,
                child: Column(
                  children: [
                    AppModeItem(controller: controller, title: Words.appMode.tr, logo: CustomImages.modeIcon,),
                    AppModeItem(controller: controller, title: Words.autoMode.tr, logo: CustomImages.phoneModeIcon, withBorder: false, isAppMode: false,),
                  ],
                )
              ),
            ),
          );
        }
    );
  }
}
