import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Home/AddNewReservation_Controller.dart';
import '../../widget/Auth/Auth_Button(WithoutCheckBox).dart';
import '../../widget/Home2/ChairsSelection_Widget.dart';
import '../../widget/Home2/ReservationStatusRow.dart';

class ChairsReserveScreen extends StatelessWidget {
  const ChairsReserveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddNewReservationControllerImp());
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'حجز مقعد',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              EneftyIcons.arrow_left_3_outline,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Column(
          children: [
            ReservationStatusRow(),
            Container(
              height: 84.h,
              width: 100.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    child: Container(
                      height: 75.h,
                      width: 85.w,
                      child: ChairSelectionWidget(),
                    ),
                  ),
                  Positioned(
                    bottom: 1.h,
                    child: AuthButtonWithoutCheckBox(
                      buttonText: 'تأكيد',
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
