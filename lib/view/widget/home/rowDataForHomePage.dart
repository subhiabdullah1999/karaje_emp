import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class RowDataForHomePage extends StatelessWidget {
  final String text1;
  final String text2;
  final IconData icon1;
  final IconData icon2;
  final void Function()? onTap1;
  final void Function()? onTap2;

  const RowDataForHomePage(
      {super.key,
      required this.text1,
      required this.text2,
      required this.icon1,
      required this.icon2,
      this.onTap1,
      this.onTap2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap1,
          child: Container(
            height: 11.h,
            width: 40.w,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon1,
                  size: 24,
                  color: Colors.white,
                ),
                SizedBox(height: 0.6.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    text1,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontFamily: 'Cairo',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        InkWell(
          onTap: onTap2,
          child: Container(
            height: 11.h,
            width: 40.w,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon2,
                  size: 24,
                  color: Colors.white,
                ),
                SizedBox(height: 0.6.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    text2,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontFamily: 'Cairo',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
