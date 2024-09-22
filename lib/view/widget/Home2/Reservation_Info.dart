import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/color.dart';

class ReservationInfo extends StatelessWidget {
  final String label1;
  final String label2;

  const ReservationInfo(this.label1, this.label2, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.4.h),
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: '$label1: ',
              style: TextStyle(
                color: AppColor.black,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w500,
                fontSize: 11.sp,
              ),
            ),
            TextSpan(
              text: label2,
              style: TextStyle(
                color: AppColor.red,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w500,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
