import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Home/CheckBarCode_Controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/services/services.dart';

class QRCodeScannerScreen extends StatelessWidget {
  const QRCodeScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: const Text(
            'فحص الباركود',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              EneftyIcons.arrow_left_3_outline,
              color: AppColor.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: GetBuilder<CheckBarCodeControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: SizedBox(
              height: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  QRView(
                    key: controller.qrKey,
                    onQRViewCreated: (qrViewController) {
                      qrViewController.scannedDataStream.listen((scanData) {
                        qrViewController.pauseCamera();
                        myServices.sharedPreferences
                            .setString("reservationId", '${scanData.code}');
                        controller.getReservation(context);
                      });
                    },
                  ),
                  Positioned(
                    top: 7.h,
                    child: Container(
                      alignment: Alignment.center,
                      height: 5.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          color: AppColor.white.withOpacity(0.30),
                          borderRadius: BorderRadius.circular(9.sp)),
                      child: Text(
                        'إفحص الباركود',
                        style: TextStyle(
                          color: AppColor.black,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 7.h,
                    child: Container(
                      alignment: Alignment.center,
                      height: 5.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          color: AppColor.white.withOpacity(0.30),
                          borderRadius: BorderRadius.circular(9.sp)),
                      child: Text(
                        'إفحص الباركود',
                        style: TextStyle(
                          color: AppColor.black,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 20.h,
                    child: Lottie.asset(AppImageAsset.qrcode2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
