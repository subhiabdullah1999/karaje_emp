import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ReservationStatusRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 8.w),
        StatusCircle(backgroundColor: Color(0xffE50909)),
        SizedBox(width: 3.w),
        StatusText(text: 'محجوز'),
        SizedBox(width: 13.w),
        StatusCircle(backgroundColor: Color(0xffEBEFF3)),
        SizedBox(width: 3.w),
        StatusText(text: 'غير محجوز'),
        SizedBox(width: 13.w),
        StatusCircle(backgroundColor: Color(0xff2F4C78)),
        SizedBox(width: 3.w),
        StatusText(text: 'مكانك'),
      ],
    );
  }
}

class StatusCircle extends StatelessWidget {
  final Color backgroundColor;

  StatusCircle({required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 6.sp,
      backgroundColor: backgroundColor,
    );
  }
}

class StatusText extends StatelessWidget {
  final String text;

  StatusText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Cairo',
      ),
    );
  }
}
