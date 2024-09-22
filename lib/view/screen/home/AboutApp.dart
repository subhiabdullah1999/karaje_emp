import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajeapp/core/constant/imgaeasset.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/color.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              width: 100.w,
              height: 35.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 16.h,
                    child: SizedBox(
                      height: 15.h,
                      child: Image.asset(
                        AppImageAsset.logo,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 29.h,
                    child: Text(
                      'كراجي ',
                      style: TextStyle(
                        color: AppColor.orange,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5.h,
                    left: 5.w,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  Positioned(
                    top: 6.h,
                    child: Text(
                      'حول التطبيق',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.w, 2.h, 10.w, 0),
              height: 60.h,
              child: Column(
                children: [
                  Text(
                    'مرحبًا بك في تطبيق كراجي الوجهة الرائدة لتجربة النقل السياحي السلسة والمميزة. يوفر تطبيقنا حلاً شاملاً لحجز الحافلات بكل سهولة ويُمكنك من الدفع الآمن عبر الإنترنت. استمتع برحلاتك بلا قلق، حيث يُمكنك أيضًا الحصول على تذاكرك الإلكترونية بسهولة. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "story link",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.orange,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "حقوق التطبيق محفوظة لصالح شركة",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black45,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'نسخة التطبيق 1.0.1',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black45,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Column(
                    children: [
                      Text(
                        "تم تطويره بخبرات سورية",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black45,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        "وبكل اعتزاز",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
