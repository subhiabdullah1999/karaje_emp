import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Auth/SignIn_Controller.dart';
import '../../../core/constant/color.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const AuthButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final SignInControllerImp signInController = Get.put(SignInControllerImp());
    return signInController.isClick == true.obs
        ? CircleAvatar(
            backgroundColor: AppColor.orange,
            radius: 20.sp,
            child: const CircularProgressIndicator(color: AppColor.white),
          )
        : GestureDetector(
            onTap: signInController.isChecked.value == true ? onPressed : null,
            child: Container(
              alignment: Alignment.center,
              height: 7.5.h,
              width: 88.w,
              decoration: BoxDecoration(
                color: signInController.isChecked.value == true
                    ? AppColor.orange
                    : AppColor.greylight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  color: AppColor.white,
                  height: 0.2.h,
                  fontSize: 15.sp,
                  fontFamily: 'Cairo',
                ),
              ),
            ),
          );
  }
}
