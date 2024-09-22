import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';


class CustomLocation extends StatelessWidget {
  final String location1;
  final String location2;

  const CustomLocation(this.location1, this.location2, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          location1,
          style: TextStyle(
            color: AppColor.black,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
            fontSize: 9.sp,
          ),
        ),
        Icon(
          Icons.person_outline_sharp,
          size: 13.sp,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 1.h, 0, 1.h),
          child: Image.asset(
            AppImageAsset.arrowDown,
            height: 6.h,
          ),
        ),
        Icon(
          Icons.location_on_outlined,
          size: 13.sp,
        ),
        Text(
          location2,
          style: TextStyle(
            color: AppColor.black,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
            fontSize: 9.sp,
          ),
        ),
      ],
    );
  }
}
