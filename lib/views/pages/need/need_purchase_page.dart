import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/tools/constants/images.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';
import 'package:usefulpoints/views/pages/transaction/transaction_page.dart';
import 'package:usefulpoints/views/widgets/custom_app_bar.dart';
import 'package:usefulpoints/views/widgets/custom_button.dart';

class NeedPurchasePage extends StatelessWidget {
  const NeedPurchasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(title: '',),
      body: SizedBox(
        height: size.height - 85,
        child: Column(
          children: [
            SizedBox(
              width: size.width * .80,
              child: Column(
                children: [
                  Text(
                    Words.needPurchase.tr,
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
            SizedBox(height: 15.h,),
            Image.asset(CustomImages.bookImage, height: 300.h,),
            Text(Words.bookPrice.tr, style: robotoRegular.displayMedium?.copyWith(color: Theme.of(context).hintColor),),
            Text('100 000 ${Words.som.tr}', style: robotoBold.displayLarge?.copyWith(color: AppColors.orangeButtonColor),),
            const Spacer(),
            InkWell(
              onTap: () => Get.to(const TransactionPage(), transition: Transition.leftToRight),
              child: CustomButton(title: Words.buyBook.tr),
            ),
          ],
        ),
      ),
    );
  }
}
