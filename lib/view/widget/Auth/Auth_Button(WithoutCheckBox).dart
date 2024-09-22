import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Home/AddNewReservation_Controller.dart';
import '../../../controller/Home/AddNewTrip_Controller.dart';
import '../../../core/constant/color.dart';

class AuthButtonWithoutCheckBox extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const AuthButtonWithoutCheckBox({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final AddNewTripControllerImp addNewTripController =
        Get.put(AddNewTripControllerImp());
    final AddNewReservationControllerImp addNewReservationController =
    Get.put(AddNewReservationControllerImp());
    return addNewTripController.isClick == true.obs || addNewReservationController.isClick==true.obs
        ? CircleAvatar(
            backgroundColor: AppColor.orange,
            radius: 20.sp,
            child: const CircularProgressIndicator(color: AppColor.white),
          )
        : GestureDetector(
            onTap: onPressed,
            child: Container(
              alignment: Alignment.center,
              height: 7.5.h,
              width: 88.w,
              decoration: BoxDecoration(
                color: AppColor.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  color: AppColor.white,
                  height: 0.2.h,
                  fontSize: 13.sp,
                  fontFamily: 'Cairo',
                ),
              ),
            ),
          );
  }
}
