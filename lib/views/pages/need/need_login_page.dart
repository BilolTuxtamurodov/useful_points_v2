import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';
import 'package:usefulpoints/views/pages/login/login_page.dart';
import 'package:usefulpoints/views/widgets/custom_app_bar.dart';
import 'package:usefulpoints/views/widgets/custom_button.dart';

class NeedLoginPage extends StatelessWidget {
  const NeedLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(title: '',),
      body: SizedBox(
        height: size.height - 85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * .80,
              child: Column(
                children: [
                  Text(
                    Words.needLogin.tr,
                    style: robotoBold.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            SizedBox(
              width: size.width * .75,
              child: Column(
                children: [
                  Text(
                    Words.accessOnlyThreeChapter.tr,
                    style: robotoRegular.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => Get.to(const LoginPage(), transition: Transition.leftToRight),
              child: CustomButton(title: Words.loginToProfile.tr),
            ),
          ],
        ),
      ),
    );
  }
}
