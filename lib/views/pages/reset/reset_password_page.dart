import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:usefulpoints/controller/reset/reset_password_controller.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';
import 'package:usefulpoints/views/widgets/custom_app_bar.dart';
import 'package:usefulpoints/views/widgets/custom_button.dart';
import 'package:usefulpoints/views/widgets/custom_form_field.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder(
        init: ResetPasswordController(Get.find()),
        builder: (controller) {
          return Scaffold(
            appBar: CustomAppBar(title: Words.registration.tr,),
            body: SingleChildScrollView(
              child: SizedBox(
                height: size.height - 85.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: Text(Words.weWillSendSmsCode.tr, style: robotoLight.displayLarge?.copyWith(color: Theme.of(context).colorScheme.primary),)),
                    SizedBox(height: 15.h,),
                    CustomFormField(
                      controller: controller.emailController,
                      hintText: Words.email.tr,
                      inputType: TextInputType.emailAddress,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => controller.resetPassword(),
                      child: CustomButton(
                          title: Words.actionContinue.tr
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
