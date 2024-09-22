import 'package:flutter/material.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String? mask;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?) valid;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.valid,
    required this.mask,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
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
          TextFormField(
            validator: valid,
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: mask != null
                ? [
                   MaskInputFormatter(mask: '###########')
                  ]
                : [MaskInputFormatter(mask: null)],
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: AppColor.grey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: AppColor.primaryColor),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: AppColor.red),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                height: 0.2.h,
                fontSize: 11.sp,
                fontFamily: 'Cairo',
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
