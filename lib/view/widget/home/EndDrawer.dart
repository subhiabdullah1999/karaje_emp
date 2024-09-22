import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajeapp/view/screen/Auth/SignIn_Screen.dart';
import 'package:karajeapp/view/screen/home/AboutApp.dart';
import 'package:karajeapp/view/screen/home/CallUs.dart';
import 'package:karajeapp/view/screen/home/terms_and_conditions.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/routes.dart';
import '../../../core/services/services.dart';
import '../../../linkapi.dart';
import '../../screen/home/switchScreen.dart';
import 'EndDrawerListTile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return SafeArea(
      child: Drawer(
        width: 74.w,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 2.h,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.black12,
                  child: Icon(
                    Icons.person,
                    color: Colors.black54,
                    size: 30.sp,
                  ),
                ),
                title: const Text(
                  'مرحبا',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Cairo',
                  ),
                ),
                subtitle: Text(
                  AppLink.companyName,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
                onTap: () {
                  // Add your action for Item 1 here.
                },
              ),
              Divider(thickness: 0.2.h),

              EndDrawerListTile(
                title: 'الرئيسية',
                onPressed: () {
                  Get.back();
                },
                icon: EneftyIcons.home_3_outline,
              ),
              EndDrawerListTile(
                title: 'المسافرون',
                onPressed: () {
                  Get.to(() => SwitchScreen(
                        indexScreen: 1,
                      ));
                },
                icon: EneftyIcons.people_outline,
              ),
              EndDrawerListTile(
                title: 'الرحلات',
                onPressed: () {
                  Get.to(() => SwitchScreen(
                        indexScreen: 0,
                      ));
                },
                icon: EneftyIcons.location_outline,
              ),
              EndDrawerListTile(
                title: 'التذاكر',
                onPressed: () {
                  Get.to(() => SwitchScreen(
                        indexScreen: 3,
                      ));
                },
                icon: EneftyIcons.card_outline,
              ),
              EndDrawerListTile(
                title: 'الدعم',
                onPressed: () {
                  Get.to(() => const CallUs());
                },
                icon: EneftyIcons.a_24_support_outline,
              ),
              EndDrawerListTile(
                title: 'سياسة الخصوصية والاستخدام',
                onPressed: () {
                  Get.to(() => TermsAndConditions());
                },
                icon: EneftyIcons.stickynote_outline,
              ),
              EndDrawerListTile(
                title: 'حول التطبيق',
                onPressed: () {
                  Get.to(() => const AboutApp());
                },
                icon: EneftyIcons.info_circle_outline,
              ),
              EndDrawerListTile(
                title: 'تسجيل الخروج ',
                onPressed: () {
                  myServices.sharedPreferences.clear();
                  Get.offAll(const SignInScreen());
                },
                icon: EneftyIcons.logout_outline,
              ),
              Divider(thickness: 0.2.h),
              SizedBox(
                height: 1.h,
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
              // Add more items as needed.
            ],
          ),
        ),
      ),
    );
  }
}
