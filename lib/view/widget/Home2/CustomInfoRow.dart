import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/color.dart';

class CustomInfoRow extends StatelessWidget {
  final String num;
  final String pay;

  const CustomInfoRow(this.num, this.pay, {super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '#',
                style: TextStyle(
                  color: AppColor.black,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(width: 0.4.h),
              Text(
                num,
                style: TextStyle(
                  color: pay=='out of time'? AppColor.red : AppColor.green,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                pay=='out of time' ? 'منتهية' :'تم الدفع',
                style: TextStyle(
                  color: pay=='out of time' ? AppColor.red : AppColor.green,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(width: 0.4.h),
              Icon(
                pay=='out of time'?Icons.alarm_off:Icons.info_outline,
                color: pay=='out of time' ? AppColor.red : AppColor.green,
                size: 22.sp,
              ),
            ],
          )
        ],
      ),
    );
  }
}
