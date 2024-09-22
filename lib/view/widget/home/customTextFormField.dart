import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class CustomTextFormField extends StatelessWidget {
  final bool? isDense;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData icon;
  // final void Function()? onTap;
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.validator,
    this.isDense,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: TextStyle(fontSize: 15.sp, color: Colors.black),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: Colors.black12)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: AppColor.primaryColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: Colors.redAccent)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: Colors.redAccent)),
          isDense: true,
          prefixIcon: Icon(icon, size: 20.sp, color: Colors.black54),
          contentPadding: EdgeInsets.symmetric(
              vertical: isDense == true ? 1.5.h : 0.7.h, horizontal: 4.w)),
    );
  }
}
