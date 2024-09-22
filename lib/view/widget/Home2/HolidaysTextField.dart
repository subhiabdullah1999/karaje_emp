import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../controller/Home/AddNewTrip_Controller.dart';

class HolidaysTextField extends StatefulWidget {
  final String labelText;

  const HolidaysTextField({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  @override
  _HolidaysTextFieldState createState() => _HolidaysTextFieldState();
}

class _HolidaysTextFieldState extends State<HolidaysTextField> {
  final AddNewTripControllerImp addNewTripController =
      Get.put(AddNewTripControllerImp());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewTripControllerImp>(builder: (controller) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          height: 13.h,
          width: 90.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.labelText,
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
                child: InkWell(
                  onTap: () async {
                    addNewTripController.update();
                    final List<DateTime>? pickedDates =
                        await showDialog<List<DateTime>>(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              content: SizedBox(
                                width: double.maxFinite,
                                height: 35.h,
                                child: TableCalendar(
                                  weekNumbersVisible: false,
                                  daysOfWeekVisible: false,
                                  headerVisible: false,
                                  firstDay:
                                      addNewTripController.selectedStartDate,
                                  focusedDay: DateTime.now(),
                                  lastDay:
                                      addNewTripController.selectedSEndDate,
                                  selectedDayPredicate: (DateTime day) {
                                    return addNewTripController.selectedDates
                                        .contains(day);
                                  },
                                  onDaySelected: (DateTime selectedDay,
                                      DateTime focusedDay) {
                                    setState(() {
                                      if (!addNewTripController.selectedDates
                                          .contains(selectedDay)) {
                                        addNewTripController.selectedDates
                                            .add(selectedDay);
                                        addNewTripController.update();
                                      } else {
                                        addNewTripController.selectedDates
                                            .remove(selectedDay);
                                        addNewTripController.update();
                                      }
                                    });
                                  },
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    addNewTripController.update();
                                  },
                                  child: Text('خروج'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(
                                        addNewTripController.selectedDates);
                                    print(addNewTripController.selectedDates);
                                  },
                                  child: Text('تأكيد'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );

                    if (pickedDates != null) {
                      // addNewTripController.updateSelectedDates(pickedDates);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 1.5.h, 4.w, 0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Builder(
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return Text(
                              '${addNewTripController.selectedDates.length} ${addNewTripController.selectedDates.length == 1 ? 'يوم' : 'أيام'}',
                              style: const TextStyle(
                                fontFamily: 'Cairo',
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
