import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:karajeapp/controller/Home/AddNewReservation_Controller.dart';
import 'package:karajeapp/controller/Home/AddNewTrip_Controller.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../core/services/services.dart';

class ReservationTextField extends StatelessWidget {
  final String labelText;
  final DateTime controller;

  const ReservationTextField({
    super.key,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final AddNewReservationControllerImp addNewReservationController =
        Get.put(AddNewReservationControllerImp());
    MyServices myServices = Get.find();

    return SizedBox(
      height: 13.h,
      width: 90.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
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
                String? startDateString =
                    myServices.sharedPreferences.getString("Start_Date");
                String? endDateString =
                    myServices.sharedPreferences.getString("End_date");
                if (startDateString != null || endDateString != null) {
                  DateTime startDate = DateTime.parse(startDateString!);
                  DateTime endDate = endDateString != null
                      ? DateTime.parse(endDateString!)
                      : DateTime(3000);
                  DateTime? dateTime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 30)),
                    selectableDayPredicate: (DateTime date) {
                      // Check if the date is not in the list of excluded dates
                      return addNewReservationController.ExceptDate.isEmpty
                          ? true
                          : !addNewReservationController.ExceptDate.contains(
                              date);
                    },
                  );

                  if (dateTime != null) {
                    addNewReservationController.updateReservationDate(dateTime);
                    addNewReservationController.SearchTrips(
                        DateFormat('yyyy-MM-dd').format(dateTime));
                  }
                }
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 1.5.h, 4.w, 0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Obx(() {
                  final reservationDate =
                      addNewReservationController.ReservationDate;
                  return Text(
                    "مثال : ${reservationDate.year.toString().padLeft(2, '0')}-${reservationDate.month.toString().padLeft(2, '0')}-${reservationDate.day.toString().padLeft(2, '0')}",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
