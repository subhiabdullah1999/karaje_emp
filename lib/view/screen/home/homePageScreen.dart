import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajeapp/view/screen/home/switchScreen.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/home/homePageController.dart';
import '../../../core/constant/color.dart';
import '../../../linkapi.dart';
import '../../widget/home/cacheImage.dart';
import '../../widget/home/rowDataForHomePage.dart';
import '../Home2/QRCodeScanner_Screen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return GetBuilder<HomePageController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.5.w),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              height: 14.h,
              width: 20.w,
              child: CustomCacheImage(
                imageUrl:
                '${AppLink.imagesServer}logos/${AppLink.logo}',
              )
            ),
            Text(
              AppLink.companyName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25.sp,
                  fontFamily: 'Cairo',
                  color: AppColor.primaryColor),
            ),
            SizedBox(
              height: 10.h,
            ),
            RowDataForHomePage(
              onTap1: () {
                Get.to(() => SwitchScreen(
                      indexScreen: 0,
                    ));
              },
              icon1: EneftyIcons.location_outline,
              text1: 'الرحلات',
              onTap2: () {
                Get.to(() => SwitchScreen(
                      indexScreen: 1,
                    ));
              },
              icon2: EneftyIcons.people_outline,
              text2: 'المسافرون',
            ),
            SizedBox(
              height: 4.h,
            ),
            RowDataForHomePage(
              onTap1: () {
                Get.to(const QRCodeScannerScreen());
              },
              icon1: Icons.qr_code_scanner,
              text1: 'فحص الباركود',
              onTap2: () {
                Get.to(() => SwitchScreen(
                      indexScreen: 3,
                    ));
              },
              icon2: EneftyIcons.card_outline,
              text2: 'التذاكر',
            ),
            SizedBox(
              height: 4.h,
            ),
            RowDataForHomePage(
              onTap1: () {
                Get.to(() => SwitchScreen(
                      indexScreen: 4,
                    ));
              },
              icon1: EneftyIcons.note_outline,
              text1: 'حجز لمسافر',
              onTap2: () {
                Get.to(() => SwitchScreen(
                      indexScreen: 5,
                    ));
              },
              icon2: EneftyIcons.location_add_outline,
              text2: 'اضافة رحلة',
            ),
          ],
        ),
      );
    });
  }
}
