import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:usefulpoints/controller/book/book_controller.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/tools/constants/images.dart';
import 'package:usefulpoints/data/tools/enums/book_mode.dart';
import 'package:usefulpoints/data/tools/enums/text_align_style.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';
import 'package:usefulpoints/domain/data/book/book_data.dart';
import 'package:usefulpoints/views/pages/book/widget/book_text_style_item.dart';
import 'package:usefulpoints/views/pages/book/widget/custom_drawer.dart';
import 'package:usefulpoints/views/pages/book/widget/text_align_style_item.dart';
import 'package:usefulpoints/views/pages/book/widget/text_style_item.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder(
        init: BookController(Get.find()),
        builder: (controller) {
          return Theme(
            data: controller.getMode(),
            child: Scaffold(
              drawer: const CustomDrawer(),
              appBar: AppBar(
                title: Text(Words.book.tr, style: robotoRegular.displayMedium?.copyWith(fontSize: 20.sp),),
                centerTitle: true,
                actions: [
                  InkWell(
                    onTap: () => controller.showModal(),
                    child: Container(
                      margin: EdgeInsets.only(right: 15.w),
                      child: SvgPicture.asset(CustomImages.settingsIcon,),),),
                ],
              ),
              body: SingleChildScrollView(
                child: SizedBox(
                  height: size.height - 85.h,
                  child: Stack(
                    children: [
                      if (controller.isLoading)
                        const Center(child: CircularProgressIndicator(color: AppColors.orangeButtonColor,)),
                      ListView.builder(
                        controller: controller.scrollController,
                        shrinkWrap: true,
                        itemCount: controller.books.length,
                        itemBuilder: (context, index) {
                          BookData data = controller.books[index];
                          return Container(
                            padding: EdgeInsets.all(5.r),
                            child: Text(
                              parse(data.translate?.uz?.context??'').body?.text??'',
                              style: controller.currentTextStyle.copyWith(fontSize: controller.fontSize),
                              textAlign: controller.getTextAlign(),
                            ),
                          );
                        }
                      ),
                      Visibility(
                        visible: controller.canShowModal,
                        child: Positioned(
                          bottom: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(5.r), topLeft: Radius.circular(5.r)),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 15.h),
                              width: size.width,
                              decoration: BoxDecoration(
                                color: controller.getMode().primaryColor,
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () => controller.changeMode(BookMode.white),
                                        child: BookTextStyleItem(current: controller.currentMode == BookMode.white, color: AppColors.white, titleColor: AppColors.black,),
                                      ),
                                      InkWell(
                                        onTap: () => controller.changeMode(BookMode.orange),
                                        child: BookTextStyleItem(current: controller.currentMode == BookMode.orange, color: AppColors.orangeLight, titleColor: AppColors.black,),
                                      ),
                                      InkWell(
                                        onTap: () => controller.changeMode(BookMode.black),
                                        child: BookTextStyleItem(current: controller.currentMode == BookMode.black, color: AppColors.backgroundColorDark, titleColor: AppColors.white,),
                                      ),
                                    ],
                                  ),
                                  Divider(color: AppColors.greyLight,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 20.w),
                                        child: Text(Words.fontSize.tr, style: robotoMedium.displayMedium,),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: size.width * .90,
                                            child: Slider(
                                              activeColor: AppColors.orangeButtonColor,
                                              inactiveColor: AppColors.greyLight,
                                              min: 12,
                                              max: 32,
                                              value: controller.fontSize,
                                              onChanged: (ss) => controller.changeSlider(ss),
                                            ),
                                          ),
                                          Text('${controller.fontSize.toInt()}'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(color: AppColors.greyLight,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 20.w),
                                        child: Text(Words.font.tr, style: robotoMedium.displayMedium,),
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                              onTap: () => controller.changeTextStyle(robotoRegular.displayMedium!),
                                              child: TextStyleItem(title: 'Roboto', current: controller.currentTextStyle == robotoRegular.displayMedium!, textStyle: robotoRegular.displayMedium!,)),
                                          InkWell(
                                              onTap: () => controller.changeTextStyle(literataRegular.displayMedium!),
                                              child: TextStyleItem(title: 'Literata', current: controller.currentTextStyle == literataRegular.displayMedium!, textStyle: literataRegular.displayMedium!,)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(color: AppColors.greyLight,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 20.w),
                                        child: Text(Words.bookTextStyle.tr, style: robotoMedium.displayMedium,),
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                              onTap: () => controller.changeTextAlign(TextAlignStyle.justify),
                                              child: TextAlignStyleItem(logo: CustomImages.alignJustifyIcon, current: controller.currentAlignStyle == TextAlignStyle.justify)),
                                          InkWell(
                                              onTap: () => controller.changeTextAlign(TextAlignStyle.left),
                                              child: TextAlignStyleItem(logo: CustomImages.alignLeftIcon, current: controller.currentAlignStyle == TextAlignStyle.left)),
                                        ],
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: !controller.canShowModal,
                        child: Positioned(
                          bottom: 0,
                          child: InkWell(
                            onTap: () => controller.goToBookChaptersPage(),
                            child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                color: controller.getMode().primaryColor,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              height: 70.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.list, color: AppColors.orangeButtonColor,),
                                      SizedBox(width: 10.w,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(Words.bookChapters.tr),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
