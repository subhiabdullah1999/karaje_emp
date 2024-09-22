import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Home/AddNewTrip_Controller.dart';

class StartTimeTextField extends StatelessWidget {
  final String labelText;
  final DateTime controller;

  const StartTimeTextField({
    super.key,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final AddNewTripControllerImp addNewTripController =
        Get.put(AddNewTripControllerImp());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 13.h,
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
            SizedBox(
              height: 7.h,
              width: 90.w,
              child: GestureDetector(
                onTap: () async {
                  DateTime? dateTime = await showOmniDateTimePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate:
                        DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 3652)),
                    is24HourMode: false,
                    isShowSeconds: false,
                    minutesInterval: 1,
                    secondsInterval: 1,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    constraints: const BoxConstraints(
                      maxWidth: 350,
                      maxHeight: 650,
                    ),
                    transitionBuilder: (context, anim1, anim2, child) {
                      return FadeTransition(
                        opacity: anim1.drive(
                          Tween(
                            begin: 0,
                            end: 1,
                          ),
                        ),
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 200),
                    barrierDismissible: true,
                  );

                  if (dateTime != null) {
                    addNewTripController.updateSelectedStartTime(dateTime);
                    //print("Selected Date: $dateTime");
                  }
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 1.5.h, 4.w, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "${addNewTripController.selectedStartDate.hour.toString().padLeft(2, '0')}:${addNewTripController.selectedStartDate.minute.toString().padLeft(2, '0')}",
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
