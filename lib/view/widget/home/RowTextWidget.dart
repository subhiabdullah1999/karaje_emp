import 'package:flutter/material.dart';
import 'package:karajeapp/core/constant/color.dart';
import 'package:sizer/sizer.dart';

class RowTextWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final int? type;

  const RowTextWidget(
      {super.key, required this.text1, required this.text2, this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(color: Colors.black, fontSize: 13.sp),
        ),
        Text(
          text2,
          style: TextStyle(
              color: type == 1 ? AppColor.primaryColor : Colors.black,
              fontSize: 13.sp),
        ),
      ],
    );
  }
}

class RowTextWidget2 extends StatelessWidget {
  final String text1;
  final String text2;
  final int? type;

  const RowTextWidget2(
      {super.key, required this.text1, required this.text2, this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(color: Colors.black, fontSize: 10.sp),
        ),
        
         Flexible(
           child: Text(
              text2,
              overflow: TextOverflow.clip,
              style: TextStyle(
                  color: type == 1 ? AppColor.primaryColor : Colors.black,
                  fontSize: 10.sp),
            
                 ),
         ),
      ],
    );
  }
}
