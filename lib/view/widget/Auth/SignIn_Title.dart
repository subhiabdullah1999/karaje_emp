import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignInTitle extends StatelessWidget {
  const SignInTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(35.w, 15.h, 0, 0),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 8.h),
      child: Text(
        'تسجيل الدخول',
        style: TextStyle(
          color: Colors.black,
          height: 0.2.h,
          fontSize: 19.sp,
          fontFamily: 'Cairo',
          letterSpacing: 1.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
