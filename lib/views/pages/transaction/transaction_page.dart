import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:usefulpoints/controller/transaction/transaction_controller.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/tools/constants/images.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';
import 'package:usefulpoints/domain/data/card/card_data.dart';
import 'package:usefulpoints/views/pages/login/login_page.dart';
import 'package:usefulpoints/views/widgets/custom_app_bar.dart';
import 'package:usefulpoints/views/widgets/custom_button.dart';
import 'package:usefulpoints/views/widgets/top_snack_bar.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder(
      init: TransactionController(Get.find()),
      builder: (controller){
        return Scaffold(
          appBar: CustomAppBar(title: Words.choosePaymentType.tr,),
          body: SizedBox(
            height: size.height - 85,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  height: 65.h,
                  child: Row(
                    children: [
                      Image.asset(CustomImages.bookImage),
                      SizedBox(width: 10.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Words.bookPrice.tr, style: robotoRegular.displayMedium?.copyWith(color: Theme.of(context).hintColor),),
                          Text('100 000 ${Words.som.tr}', style: robotoBold.displayLarge,),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Words.withMoneyTransfer.tr, style: robotoBold.displayLarge,),
                      SizedBox(height: 10.h,),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.cards.length,
                        itemBuilder: (context, index) {
                          CardData data = controller.cards[index];
                          return Container(
                            padding: EdgeInsets.all(10.r),
                            margin: EdgeInsets.symmetric(horizontal: 5.h),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(data.card??''),
                                      Text(data.owner_name??'', style: robotoRegular.displayMedium?.copyWith(color: Theme.of(context).hintColor),),
                                    ],
                                  ),
                                  constraints: BoxConstraints(
                                      maxWidth: size.width * .70
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Clipboard.setData(ClipboardData(text: data.card??''));
                                      showSnackBar(title: Words.success.tr, subtitle: '${data.card??''} ${Words.successCopied.tr}');
                                    },
                                    child: SvgPicture.asset(CustomImages.copyIcon, color: Theme.of(context).dividerColor,),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      ),
                      SizedBox(height: 15.h,),
                      Center(child: Text(Words.sendScreenShoot.tr, style: robotoRegular.displayMedium?.copyWith(color: AppColors.orangeButtonColor),)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Divider(color: Theme.of(context).hintColor, height: 10,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(Words.ifElse.tr, style: robotoLight.displayLarge?.copyWith(color: Theme.of(context).hintColor),),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(color: Theme.of(context).hintColor,),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Words.enterYourCardInfo.tr, style: robotoBold.displayLarge,),
                      SizedBox(height: 10.h,),
                      InkWell(
                        onTap: () => showGetSnackBar(title: Words.failed.tr, subtitle: Words.thisFunctionDontWorking.tr, isError: true),
                        child: Container(
                          padding: EdgeInsets.all(10.r),
                          margin: EdgeInsets.symmetric(horizontal: 5.h),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(CustomImages.cardsIcon),
                              SizedBox(width: 15.w,),
                              Text(Words.payment.tr, style: robotoBold.displayMedium,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => Get.to(const LoginPage(), transition: Transition.leftToRight),
                  child: CustomButton(title: Words.checkPurchase.tr, margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Words.needHelp.tr, style: robotoRegular.displayMedium),
                    SizedBox(width: 5.w,),
                    Text(Words.contactAdmin.tr, style: robotoRegular.displayMedium?.copyWith(color: AppColors.orangeButtonColor),),
                  ],
                ),
                SizedBox(height: 20.h,),
              ],
            ),
          ),
        );
      });
  }
}
