import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Home/AddNewReservation_Controller.dart';

import '../../../core/services/services.dart';

class TripsDropDown extends StatelessWidget {
  final String labelText;
  final RxInt controller;

  const TripsDropDown({
    super.key,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final AddNewReservationControllerImp addNewReservationController =
        Get.put(AddNewReservationControllerImp());

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
              child: InkWell(
                onTap: () {
                  _showDropdownMenu(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        addNewReservationController.trips.isEmpty
                            ? 'لا يوجد رحلات '
                            : addNewReservationController.trip_id == 0.obs
                                ? 'اختر الرحلة'
                                : 'من ${addNewReservationController.trips[controller.toInt()]['Start_City']['name']} إلى ${addNewReservationController.trips[controller.toInt()]['End_City']['name']}  ',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_drop_down),
                        onPressed: () => _showDropdownMenu(context),
                      ),
                    ],
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

void _showDropdownMenu(BuildContext context) {
  final AddNewReservationControllerImp addNewReservationController =
      Get.put(AddNewReservationControllerImp());
  MyServices myServices = Get.find();
  final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  final buttonRect = context.findRenderObject() as RenderBox;
  final Offset position =
      buttonRect.localToGlobal(Offset.zero, ancestor: overlay);
  final containerWidth = MediaQuery.of(context).size.width;

  List<PopupMenuItem<dynamic>> popupMenuItems = [];

  for (int index = 0;
      index < addNewReservationController.trips.length;
      index++) {
    var trips = addNewReservationController.trips[index];
    popupMenuItems.add(
      PopupMenuItem(
        value: index,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListTile(
            leading: Text('${trips['id']}'),
            title: Text(
              'من ${trips['Start_City']['name']} إلى ${trips['End_City']['name']}  ',
              style: TextStyle(
                color: Colors.black,
                height: 0.2.h,
                fontSize: 13.sp,
                fontFamily: 'Cairo',
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Row(
              children: [
                Text(
                  '${trips['company']['Companyname']} / ${addNewReservationController.formatTime('${trips['Start_Time']}')}',
                  style: TextStyle(
                    color: Colors.grey,
                    height: 0.2.h,
                    fontSize: 10.sp,
                    fontFamily: 'Cairo',
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showMenu(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.sp),
    ),
    context: context,
    position: RelativeRect.fromLTRB(
      containerWidth - position.dx - buttonRect.size.width - 10, // left
      position.dy + 10.h, // top
      containerWidth - position.dx - buttonRect.size.width, // right
      MediaQuery.of(context).size.height - position.dy, // bottom
    ),
    items: popupMenuItems,
  ).then((value) {
    if (value != null) {
      addNewReservationController.updateSelectedTripId(
          int.parse('${addNewReservationController.trips[value]['id']}'));
      addNewReservationController.updateSelectedTripName(
        value,
      );
      myServices.sharedPreferences.setString("NumberOfChairs",
          '${addNewReservationController.trips[value]['NumberOfChairs']}');

      myServices.sharedPreferences.setString(
          "Price", '${addNewReservationController.trips[value]['Price']}');

      myServices.sharedPreferences.setString("Start_Date",
          '${addNewReservationController.trips[value]['Start_Date']}');

      myServices.sharedPreferences.setString("End_date",
          '${addNewReservationController.trips[value]['End_date']}');

      for (int i = 0;
          i < addNewReservationController.trips[value]['ExceptDate'].length;
          i++) {
        addNewReservationController.ExceptDate.add(DateTime.parse(
            addNewReservationController.trips[value]['ExceptDate'][i]['date']));
      }

      myServices.sharedPreferences.setInt("trip_id", value);
    }
    print(value);
    print('trip id :${addNewReservationController.trips[value]['id']}');
    print(
        'NumberOfChairs is :${myServices.sharedPreferences.getString("NumberOfChairs")}');
    print('ExceptDate : ${addNewReservationController.ExceptDate}');
  });
}
