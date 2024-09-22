import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/Home/Reservation_Data.dart';
import '../../view/widget/Home2/Reservation_Dialog.dart';

abstract class CheckBarCodeController extends GetxController {
  getReservation(BuildContext context);
}

class CheckBarCodeControllerImp extends CheckBarCodeController {
  ReservationData reservationData = ReservationData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<Map<String, dynamic>> reservationInfo = [];
  final qrKey = GlobalKey(debugLabel: 'QR');
  var result = Rx<Barcode?>(null);
  var scanArea = Get.width < 400 || Get.height < 400 ? 150.0 : 300.0;
  QRViewController? controller;

  var exist_id = false.obs;

  var dialogShown = false.obs;

  String formatTime(String timeStr) {
    TimeOfDay time = TimeOfDay(
      hour: int.parse(timeStr.split(':')[0]),
      minute: int.parse(timeStr.split(':')[1]),
    );

    String formattedHour = '';
    String formattedMinute = '';

    if (time.hour < 12) {
      formattedHour = '${time.hour}';
    } else if (time.hour == 12) {
      formattedHour = '${time.hour}';
    } else {
      formattedHour = '${time.hour - 12}';
    }

    formattedMinute = time.minute.toString().padLeft(2, '0');

    String period = time.hour < 12 ? 'ص' : 'م';

    return '$formattedHour:$formattedMinute $period';
  }

  void updateDialogShown(bool value) {
    dialogShown.value = value;
    update();
  }

  void updateIds(bool val) {
    exist_id.value = val;
    update();
  }

  @override
  getReservation(BuildContext context) async {
    //statusRequest = StatusRequest.loading;
    update();
    var response = await reservationData.getReservation();
    reservationInfo.isNotEmpty ? reservationInfo.clear() : null;
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response is Map<String, dynamic>) {
        Map<String, dynamic> mapData = response;
        if (mapData["status"] == true) {
          Map<String, dynamic> reservationData = mapData['data']['Reservation'];
          reservationInfo.add(reservationData);
          Get.back();
          Get.dialog(ReservationDialog());
        } else {}
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar(
            "تحذير", "انت غير متصل بالانترنت يرجى التحقق من ذلك");
      } else if (statusRequest == StatusRequest.serverfailure) {
        return Get.snackbar(
          "تحذير",
          "حدث خطأ غير متوقع",
          backgroundColor: AppColor.red.withOpacity(0.7),
          colorText: AppColor.white,
        );
      }
    } else {
      Get.back();
      Get.dialog(
        Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.sp),
          ),
          child: SizedBox(
            height: 25.h,
            width: 90.w,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Icon(
                    Icons.info_outline,
                    size: 60.sp,
                    color: AppColor.orange,
                  ),
                ),
                Text(
                  'Oops',
                  style: TextStyle(
                    color: AppColor.greylight,
                    height: 0.2.h,
                    fontSize: 19.sp,
                    fontFamily: 'Cairo',
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'لا يوجد حجز بهذا الاسم ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.grey,
                    height: 0.2.h,
                    fontSize: 11.sp,
                    fontFamily: 'Cairo',
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  void onClose() {
    controller?.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.onClose();
  }

  void reassemble() {
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) {});
  }

  void closeScanner() {
    Get.back();
  }

  @override
  void onInit() {
    reservationInfo;
    //getReservation();
    super.onInit();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    reservationInfo;
    //getReservation();
    super.dispose();
  }
}
