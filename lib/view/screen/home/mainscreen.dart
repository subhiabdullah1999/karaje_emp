import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/Home/CheckBarCode_Controller.dart';
import '../../../controller/home/mainController.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/Home/EndDrawer.dart';
import '../Home2/QRCodeScanner_Screen.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    Get.put(CheckBarCodeControllerImp());
    return Obx(() => Scaffold(
          key: controller.scaffoldKey,
          body: controller.screens[controller.bottomNavIndex.value],
          floatingActionButton: GetBuilder<CheckBarCodeControllerImp>(
              builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: FloatingActionButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.sp)),
                    onPressed: () async {
                      Get.to(const QRCodeScannerScreen());
                    },
                    backgroundColor: const Color(0xffEC441D),
                    child: const Icon(
                      color: Colors.white,
                      Icons.qr_code_scanner,
                    ),
                  ))),
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: true,
            title: Text(
              controller.titleAppBar[controller.bottomNavIndex.value],
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w600,
              ),
            ),
            // leading: controller.bottomNavIndex.value == 0
            //     ? IconButton(
            //         icon: const Icon(
            //           EneftyIcons.notification_outline,
            //           color: Colors.black,
            //         ),
            //         onPressed: () {},
            //       )
            //     : const SizedBox(),
            actions: controller.bottomNavIndex.value != 0
                ? [
                    const SizedBox(),
                  ]
                : [
                    IconButton(
                        icon: const Icon(
                          EneftyIcons.menu_outline,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          controller.openDrawer();
                        }),
                  ],
          ),
          endDrawer: const MyDrawer(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: controller.icons.length,
            tabBuilder: (int index, bool isActive) {
              final color = isActive ? const Color(0xffEC441D) : Colors.black;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    controller.icons[index],
                    size: 24,
                    color: color,
                  ),
                  SizedBox(height: 0.6.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      controller.bottomnavigationbaritems[index],
                      maxLines: 1,
                      style: TextStyle(
                        color: color,
                        fontSize: 9.sp,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  )
                ],
              );
            },
            activeIndex: controller.bottomNavIndex.value,
            gapLocation: GapLocation.center,
            // Use GapLocation.end
            notchSmoothness: NotchSmoothness.softEdge,
            onTap: (index) {
              // Use GetX to update the _bottomNavIndex
              controller.bottomNavIndex.value = index;
            },
          ),
        ));
  }
}
