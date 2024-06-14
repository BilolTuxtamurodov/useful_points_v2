import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:usefulpoints/controller/login/login_controller.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/tools/constants/images.dart';
import 'package:usefulpoints/data/tools/enums/auth_result.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';
import 'package:usefulpoints/views/widgets/custom_app_bar.dart';
import 'package:usefulpoints/views/widgets/custom_button.dart';
import 'package:usefulpoints/views/widgets/custom_form_field.dart';
import 'package:usefulpoints/views/widgets/top_snack_bar.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder(
        init: LoginController(Get.find()),
        builder: (controller) {
          return Scaffold(
            appBar: CustomAppBar(title: Words.registration.tr,),
            body: SingleChildScrollView(
              child: SizedBox(
                height: size.height - 85.h,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        var result = await controller.loginWithGoogle();
                        if (AuthResult.success == result) {
                          showGetSnackBar(title: Words.success.tr, subtitle: Words.loginWithGoogleInfo.tr,);
                        } else {
                          showGetSnackBar(title: Words.failed.tr, subtitle: Words.loginWithGoogleInfo.tr, isError: true);
                        }
                      },
                      child: CustomButton(
                        icon: CustomImages.googleIcon,
                        border: Border.all(color: Theme.of(context).hintColor),
                        titleColor: Theme.of(context).dividerColor,
                        buttonColor: Colors.transparent,
                        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 15),
                        title: Words.fromGoogle.tr,
                      ),
                    ),
                    CustomButton(
                      icon: CustomImages.appleIcon,
                      iconColor: Theme.of(context).dividerColor,
                      border: Border.all(color: Theme.of(context).hintColor),
                      titleColor: Theme.of(context).dividerColor,
                      buttonColor: Colors.transparent,
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      title: Words.fromApple.tr,
                    ),
                    SizedBox(height: 10.h,),
                    Text(Words.ifElse.tr, style: robotoLight.displayLarge?.copyWith(color: Theme.of(context).hintColor),),
                    SizedBox(height: 10.h,),
                    CustomFormField(
                      controller: controller.fullNameController,
                      hintText: Words.fullName.tr,
                    ),
                    CustomFormField(
                      controller: controller.emailController,
                      hintText: Words.email.tr,
                      inputType: TextInputType.emailAddress,
                    ),
                    CustomFormField(
                      controller: controller.passwordController,
                      isPassword: true,
                      hintText: Words.password.tr,
                    ),
                    InkWell(
                      onTap: () => controller.registration(),
                      child: CustomButton(
                        margin: const EdgeInsets.all(15),
                        title: Words.enter.tr,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Words.haveProfile.tr, style: robotoRegular.displayMedium),
                        SizedBox(width: 5.w,),
                        InkWell(
                          onTap: () => controller.goToLoginPage(),
                          child: Text(Words.login.tr, style: robotoRegular.displayMedium?.copyWith(color: AppColors.orangeButtonColor),),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text('${Words.registrationInfoFirst.tr} ${Words.registrationInfoSecond.tr}', style: robotoLight.displaySmall?.copyWith(color: Theme.of(context).hintColor),),
                        Text(' ${Words.personalInfo.tr}', style: robotoLight.displaySmall?.copyWith(decoration: TextDecoration.underline, color: Theme.of(context).hintColor),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${Words.and.tr} ', style: robotoLight.displaySmall?.copyWith(color: Theme.of(context).hintColor)),
                            Text(Words.useOfPermission.tr, style: robotoLight.displaySmall?.copyWith(decoration: TextDecoration.underline, color: Theme.of(context).hintColor)),
                          ],
                        ),
                      ],
                    ),


                    SizedBox(height: 20.h,),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
