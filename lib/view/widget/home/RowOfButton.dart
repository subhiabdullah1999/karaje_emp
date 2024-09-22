import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'customMatrerialButton.dart';

class RowOfButton extends StatelessWidget {
  final bool isTripDay;
  final void Function()? onPressedDay;
  final void Function()? onPressedTomorrow;

  const RowOfButton(
      {super.key,
      required this.isTripDay,
      this.onPressedDay,
      this.onPressedTomorrow});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: isTripDay
              ? CustomMatrerialButton(
                  text: 'رحلات اليوم',
                  onPressed: onPressedDay,
                )
              : CustomMatrerialButtonWithBorder(
                  text: 'رحلات اليوم',
                  onPressed: onPressedDay,
                ),
        ),
        SizedBox(
          width: 3.w,
        ),
        Expanded(
            child: isTripDay == false
                ? CustomMatrerialButton(
                    text: 'الرحلات القادمة',
                    onPressed: onPressedTomorrow,
                  )
                : CustomMatrerialButtonWithBorder(
                    text: 'الرحلات القادمة',
                    onPressed: onPressedTomorrow,
                  )),
      ],
    );
  }
}
