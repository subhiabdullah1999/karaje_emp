import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajeapp/controller/update_app/update_app_controller.dart';
import 'package:karajeapp/core/class/handlingdataview.dart';
import 'package:karajeapp/linkapi.dart';
import 'package:karajeapp/view/screen/Auth/SignIn_Screen.dart';
import 'package:karajeapp/view/screen/home/mainscreen.dart';
import 'package:karajeapp/view/screen/update_app/update_app_screen.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/services/services.dart';

// ignore: must_be_immutable
class Splash extends StatelessWidget {
  MyServices myServices = Get.find();

  Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UpdateAppControllerImp());
    return GetBuilder<UpdateAppControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SafeArea(
              child: Stack(children: [
                AnimatedSplashScreen(
                  splashIconSize: Get.height,
                  splash: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 31.h,
                        child: Center(
                          child: Image.asset(
                            AppImageAsset.logo,
                            height: 20.h,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 51.h,
                        child: Center(
                          child: Text(
                            'كراجي',
                            style: TextStyle(
                              color: AppColor.orange,
                              height: 0.2.h,
                              fontSize: 25.sp,
                              fontFamily: 'Cairo',
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  nextScreen: AppLink.token == ''
                      ? const SignInScreen()
                      : controller.data["employee_app_v"] != "7.8.9"
                          ? UpdateApp()
                          : const MainScreen(),
                  splashTransition: SplashTransition.fadeTransition,
                  duration: 1000,
                ),
              ]),
            )));
  }
}
