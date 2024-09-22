import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'customDropDownbotton.dart';
import 'customTextFormFieldWithMask.dart';

// ignore: must_be_immutable
class SearchForNextTrips extends StatelessWidget {
  final void Function(Object?)? onChanged1;
  final void Function(Object?)? onChanged2;
  final void Function()? onTap1;
  final void Function()? onTap2;
  final TextEditingController dateController;
  final TextEditingController timeController;
  final void Function(String)? onFieldSubmitted;
  final List cities;
  final isSelected1;
  final isSelected2;

  const SearchForNextTrips(
      {super.key,
      this.onChanged1,
      this.onChanged2,
      this.onTap1,
      this.onTap2,
      this.isSelected1,
      this.isSelected2,
      required this.dateController,
      required this.timeController,
      required this.cities,
      this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.5.w),
      width: 94.w,
      height: 35.h,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.5.w)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
          child: Column(
            children: [
              SizedBox(
                height: 7.h,
                child: CustomDropDownButton(
                    labelText: 'من',
                    hintText: 'اختر نقطة الانطلاق',
                    hint: 'دمشق',
                    onChanged: onChanged1,
                    listData: cities,
                    isSelected: isSelected1),
              ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                height: 7.h,
                child: CustomDropDownButton(
                    labelText: 'الى',
                    hintText: 'اختر نقطة الانطلاق',
                    hint: 'حلب',
                    onChanged: onChanged2,
                    listData: cities,
                    isSelected: isSelected2),
              ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                height: 6.h,
                child: CustomTextFormFieldWithMask(
                  labelText: 'تاريخ الرحلة',
                  onFieldSubmitted: onFieldSubmitted,
                  mask: '####/##/##',
                  onTap: onTap1,
                  controller: dateController,
                  icon: Icons.calendar_month,
                ),
              ),
              SizedBox(
                height: 2.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
