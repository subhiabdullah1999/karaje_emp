import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Auth/SignIn_Controller.dart';
import '../../../core/constant/color.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?) valid;
  final void Function(String)? onChanged;

  final bool isPassword;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.valid,
    this.isPassword = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignInControllerImp signInController = Get.put(SignInControllerImp());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        // height: 17.h,
        width: 100.w,
        child: Padding(
          padding: EdgeInsets.fromLTRB(6.w, 0, 6.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                labelText,
                style: TextStyle(
                  color: Colors.black,
                  height: 0.2.h,
                  fontSize: 13.sp,
                  fontFamily: 'Cairo',
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                child: TextFormField(
                  onChanged: onChanged,
                  validator: valid,
                  controller: controller,
                  keyboardType: keyboardType,
                  obscureText: isPassword
                      ? signInController.isPasswordVisible == true.obs
                          ? false
                          : true
                      : false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 1.5.h, horizontal: 3.5.w),
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.99)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.99)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: AppColor.orange),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: AppColor.red),
                    ),
                    hintText: hintText,
                    errorStyle: TextStyle(
                      fontSize: 8.sp,
                      fontFamily: 'Cairo',
                      letterSpacing: 1,
                    ),
                    hintStyle: TextStyle(
                      height: 0.1.h,
                      fontSize: 11.sp,
                      fontFamily: 'Cairo',
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                    suffixIcon: isPassword
                        ? GestureDetector(
                            onTap: () {
                              signInController.togglePasswordVisibility();
                            },
                            child: Icon(
                              signInController.isPasswordVisible == true.obs
                                  ? EneftyIcons.eye_outline
                                  : EneftyIcons.eye_slash_outline,
                              color:
                                  signInController.isPasswordVisible == true.obs
                                      ? AppColor.orange
                                      : AppColor.grey.withOpacity(0.70),
                            ),
                          )
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
