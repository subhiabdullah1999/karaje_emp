import 'package:flutter/material.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class CustomTextFormFieldWithMask extends StatelessWidget {
  final String mask;

  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final IconData icon;
  final bool? readOnly;
  final void Function(String)? onFieldSubmitted;
  const CustomTextFormFieldWithMask(
      {super.key,
      required this.mask,
      required this.controller,
      this.validator,
      this.onTap,
      required this.icon,
      this.onFieldSubmitted,
      this.readOnly,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      controller: controller,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      style: TextStyle(
          fontSize: 12.sp, fontWeight: FontWeight.bold, color: Colors.black54),
      inputFormatters: [MaskInputFormatter(mask: mask)],
      decoration: InputDecoration(
          prefixIcon: InkWell(
            onTap: onTap,
            child: Icon(icon, size: 20.sp, color: Colors.black54),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: Colors.black12)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: AppColor.primaryColor)),
          isDense: true,
          label: Text(
            labelText,
            style: TextStyle(fontSize: 12.sp, color: Colors.black54),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w)),
    );
  }
}
