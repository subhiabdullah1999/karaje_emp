import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class CustomDropDownButton extends StatelessWidget {
  final List listData;
  final String labelText;
  final String? hint;
  final bool? isDense;
  final void Function(Object?)? onChanged;
  final isSelected;
  final String hintText;
  const CustomDropDownButton({
    super.key,
    required this.listData,
    this.isSelected,
    this.onChanged,
    this.isDense,
    this.hint,
    required this.hintText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      style: TextStyle(fontSize: 12.sp),
      decoration: InputDecoration(
          suffixIconConstraints:
              BoxConstraints(minWidth: 100.w, maxHeight: 6.5.h),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: DropdownButton(
                dropdownColor: Colors.white,
                underline: const SizedBox(),
                borderRadius: BorderRadius.circular(10.sp),
                iconSize: 33,
                icon: const Icon(
                  Icons.expand_more,
                  color: Colors.black26,
                ),
                hint: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    hint ?? listData[0],
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                isExpanded: true,
                value: isSelected,
                items: listData
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              e.toString(),
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: onChanged),
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: Colors.black12)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: Colors.black12)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: Colors.black12)),
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black54),
          isDense: true,
          label: Text(
            labelText,
            style: TextStyle(fontSize: 12.sp, color: Colors.black54),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
              horizontal: 4.w, vertical: isDense != null ? 1.5.h : 0.7.h)),
    );
  }
}

class CustomDropDownButton2 extends StatelessWidget {
  final List listData;
  final String? hint;
  final bool? isDense;
  final void Function(Object?)? onChanged;
  final isSelected;
  const CustomDropDownButton2({
    super.key,
    required this.listData,
    this.isSelected,
    this.onChanged,
    this.isDense,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      style: TextStyle(fontSize: 12.sp),
      decoration: InputDecoration(
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            child: DropdownButton(
                underline: const SizedBox(),
                borderRadius: BorderRadius.circular(5),
                iconSize: 20.sp,
                icon: const Icon(
                  Icons.expand_more,
                  color: Colors.black26,
                ),
                hint: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    hint ?? listData[0],
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                isExpanded: true,
                value: isSelected,
                items: listData
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Row(
                              children: [
                                Text(
                                  e['اتجاه الرحلة'].toString(),
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  'الساعة  ${e['انطلاق الرحلة']}',
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: onChanged),
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: Colors.black12)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: Colors.black12)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: Colors.black12)),
          contentPadding: EdgeInsets.symmetric(
              horizontal: 4.w, vertical: isDense != null ? 1.5.h : 0.7.h)),
    );
  }
}
