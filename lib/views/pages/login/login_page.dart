import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:usefulpoints/controller/login/login_controller.dart';
import 'package:usefulpoints/data/storage/app/locals/app_mode_pref/app_mode_pref.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/tools/constants/images.dart';
import 'package:usefulpoints/data/tools/enums/auth_result.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';
import 'package:usefulpoints/example.dart';
import 'package:usefulpoints/views/widgets/custom_app_bar.dart';
import 'package:usefulpoints/views/widgets/custom_button.dart';
import 'package:usefulpoints/views/widgets/custom_form_field.dart';
import 'package:usefulpoints/views/widgets/top_snack_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder(
      init: LoginController(),
        builder: (controller) {
          return Scaffold(
            appBar: CustomAppBar(title: Words.loginToProfile.tr,),
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
                      onTap: () => controller.loginWithEmail(),
                      child: CustomButton(
                        margin: const EdgeInsets.all(15),
                        title: Words.enter.tr,
                      ),
                    ),
                    Text(Words.forgotPassword.tr, style: robotoRegular.displayMedium?.copyWith(color: AppColors.orangeButtonColor),),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Words.haveNotProfile.tr, style: robotoRegular.displayMedium),
                        SizedBox(width: 5.w,),
                        Text(Words.registration.tr, style: robotoRegular.displayMedium?.copyWith(color: AppColors.orangeButtonColor),),
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
