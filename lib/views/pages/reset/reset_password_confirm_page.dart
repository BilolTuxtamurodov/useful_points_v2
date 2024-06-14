import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:usefulpoints/controller/login/login_controller.dart';
import 'package:usefulpoints/controller/reset/reset_password_controller.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';
import 'package:usefulpoints/views/widgets/custom_app_bar.dart';
import 'package:usefulpoints/views/widgets/custom_button.dart';
import 'package:usefulpoints/views/widgets/custom_form_field.dart';

class ResetPasswordConfirmPage extends StatelessWidget {
  const ResetPasswordConfirmPage({super.key});

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
                    Center(child: Text(Words.sentSmsCode.tr, style: robotoLight.displayLarge?.copyWith(color: Theme.of(context).colorScheme.primary),)),
                    SizedBox(height: 15.h,),
                    OTPTextField(
                      otpFieldStyle: OtpFieldStyle(
                        borderColor: Theme.of(context).colorScheme.primary,
                        focusBorderColor: AppColors.orangeButtonColor,
                      ),
                      controller: controller.otpController,
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      contentPadding: EdgeInsets.symmetric(vertical: 20.h),
                      fieldWidth: 45.w,
                      style: robotoRegular.displaySmall!.copyWith(fontSize: 20.sp, fontWeight: FontWeight.w400),
                      onCompleted: (value) {
                        controller.smsCodeController.text = value;
                      },
                      spaceBetween: 10.w,
                      textFieldAlignment: MainAxisAlignment.center,
                      fieldStyle: FieldStyle.box,
                    ),
                    SizedBox(height: 15.h,),
                    CustomFormField(
                      controller: controller.passwordController,
                      hintText: Words.newPassword.tr,
                      isPassword: true,
                    ),
                    CustomFormField(
                      controller: controller.prePasswordController,
                      hintText: Words.prePassword.tr,
                      isPassword: true,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => controller.resetPasswordConfirm(),
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
