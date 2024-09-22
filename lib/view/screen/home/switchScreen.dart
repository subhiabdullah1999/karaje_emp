import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajeapp/view/screen/home/passengerScreen.dart';
import 'package:karajeapp/view/screen/home/ticketScreen.dart';
import 'package:karajeapp/view/screen/home/tripsScreen.dart';
import 'package:sizer/sizer.dart';

import '../Home2/AddNewReservation_Screen.dart';
import '../Home2/AddNewTrip_Screen.dart';
import '../Home2/CheckParCode_Screen.dart';

// ignore: must_be_immutable
class SwitchScreen extends StatelessWidget {
  final int indexScreen;

  final List<Widget> screens = [
    const TripsScreen(),
    const PassengerScreen(),
    const CheckBarCodeScreen(),
    const TicketScreen(),
    const AddNewReservationScreen(),
    const AddNewTripScreen(),
  ];

  List titleAppBar = [
    'الرحلات',
    'المسافرون',
    'فحص الباركود',
    'التذاكر',
    'حجز لمسافر',
    'اضافة رحلة',
  ];

  SwitchScreen({super.key, required this.indexScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[indexScreen],
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          titleAppBar[indexScreen],
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 15.sp,
              )),
        ],
      ),
    );
  }
}
