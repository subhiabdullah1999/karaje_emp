import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Home/CheckBarCode_Controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../Auth/Auth_Button(WithoutCheckBox).dart';
import 'CustomInfoRow.dart';
import 'CustomLocation.dart';
import 'Reservation_Info.dart';

class ReservationDialog extends StatelessWidget {
  QRViewController? qrViewController;

  ReservationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckBarCodeControllerImp());
    return GetBuilder<CheckBarCodeControllerImp>(
      builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Stack(
            children: [
              Dialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: SizedBox(
                  height: 46.h,
                  width: 90.w,
                  child: Column(
                    children: [
                      CustomInfoRow(
                          '${controller.reservationInfo[0]['id']}',
                          controller.reservationInfo[0]['status'] ),
                      Text(
                        '${controller.reservationInfo[0]['name']}',
                        style: TextStyle(
                          color: AppColor.black,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w500,
                          fontSize: 17.sp,
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(3.w, 2.h, 4.w, 2.5.h),
                          child: FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // ReservationInfo('رقم الهاتف',
                                    //     '${controller.reservationInfo[0]['Client']['mobile']}'),
                                    const ReservationInfo('المهنة', 'طالب'),
                                    ReservationInfo('وقت الانطلاق',
                                        '${controller.formatTime(controller.reservationInfo[0]['Trip']['Start_Time'])}'),
                                    ReservationInfo('وقت الوصول',
                                        '${controller.formatTime(controller.reservationInfo[0]['Trip']['End_Time'])}'),
                                    ReservationInfo('سعر التذكرة',
                                        '${controller.reservationInfo[0]['Trip']['Price']} ل.س '),
                                    ReservationInfo('رقم المقعد',
                                        '${controller.reservationInfo[0]['NumChairs']}'),
                                    ReservationInfo('تاريخ الانطلاق',
                                        '${controller.reservationInfo[0]['date']}'),
                                  ],
                                ),
                                CustomLocation(
                                    '${controller.reservationInfo[0]['Trip']['Start_City']['name']}',
                                    '${controller.reservationInfo[0]['Trip']['End_City']['name']}')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          )),
    );
  }
}
