import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:usefulpoints/controller/book/book_controller.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';
import 'package:usefulpoints/domain/data/book/book_data.dart';
import 'package:usefulpoints/views/widgets/custom_app_bar.dart';
import 'package:usefulpoints/views/widgets/custom_button.dart';
import 'package:usefulpoints/views/widgets/no_internet_widget.dart';

class BookChaptersPage extends StatelessWidget {
  const BookChaptersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder(
        init: BookController(Get.find()),
        builder: (controller) {
          return Scaffold(
            appBar: CustomAppBar(title: Words.bookChapters.tr,),
            body: SingleChildScrollView(
              child: SizedBox(
                height: size.height - 85.h,
                child: Stack(
                  children: [
                    if (controller.isLoading)const Center(child: CircularProgressIndicator(color: AppColors.orangeButtonColor,)),
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
                        itemCount: controller.books.length,
                        itemBuilder: (context, index) {
                          BookData data = controller.books[index];
                          return InkWell(
                            onTap: data.is_free == false ? () => controller.goToNeedLoginPage(): () {},
                            child: Container(
                              padding: EdgeInsets.all(5.r),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: data.is_free == true ? AppColors.orangeVeryLight : Theme.of(context).colorScheme.secondary,
                                    ),
                                    alignment: Alignment.center,
                                    height: 30.h,
                                    width: 30.h,
                                    child: Text('${data.order??''}', style: robotoRegular.displayMedium?.copyWith(color: data.is_free == true ? Theme.of(context).dividerColor : Theme.of(context).hintColor),),
                                  ),
                                  SizedBox(width: 15.w,),
                                  SizedBox(
                                    width: size.width * .80,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          parse(data.translate?.uz?.title??'').body?.text??'',
                                          style: robotoRegular.displaySmall?.copyWith(color: data.is_free == true ? Theme.of(context).dividerColor : Theme.of(context).hintColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
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
