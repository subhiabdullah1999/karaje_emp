import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Home/CheckBarCode_Controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import 'QRCodeScanner_Screen.dart';

class CheckBarCodeScreen extends StatelessWidget {
  const CheckBarCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckBarCodeControllerImp());
    return GetBuilder<CheckBarCodeControllerImp>(
      builder: (controller) => HandlingDataRequest(
        statusRequest: controller.statusRequest,
        widget: Center(
          child: ElevatedButton(
            onPressed: ()  {
              Get.to(const QRCodeScannerScreen());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.orange,
              minimumSize: const Size(200, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.sp),
              ),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                'امسح رمز QR',
                style: TextStyle(
                  color: AppColor.white,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w500,
                  fontSize: 11.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
