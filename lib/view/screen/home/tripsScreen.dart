import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:karajeapp/core/class/handlingdataview.dart';
import 'package:karajeapp/view/screen/home/switchScreen.dart';
import 'package:karajeapp/view/widget/home/customMatrerialButton.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/home/tripsController.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../widget/home/RowOfButton.dart';
import '../../widget/home/cardForResultSearch.dart';
import '../../widget/home/searchForNextTrips.dart';
import '../Home2/AddNewReservation_Screen.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TripsController());
    return GetBuilder<TripsController>(builder: (controller) {
      return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.5.w),
            child: ListView(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                RowOfButton(
                  isTripDay: controller.isTripDay,
                  onPressedDay: () {
                    controller.onChangeDay(true);
                  },
                  onPressedTomorrow: () {
                    controller.onChangeDay(false);
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                controller.isTripDay
                    ? const SizedBox()
                    : SearchForNextTrips(
                        cities: controller.listCity,
                        onFieldSubmitted: (val) {
                          controller.checkUpdateDate();
                        },
                        dateController: controller.date!,
                        timeController: controller.timeController!,
                        isSelected1: controller.selectedStartCity,
                        isSelected2: controller.selectedEndCity,
                        onChanged1: (val) {
                          controller.selectCity(val, 1);
                        },
                        onChanged2: (val) {
                          controller.selectCity(val, 2);
                        },
                        onTap1: () {
                          controller.showCalender(context);
                        },
                        onTap2: () {
                          controller.customShowTimePicker(context);
                        }),
                SizedBox(
                  // height: 70.h,
                  // width: 100.w,
                  child: controller.isUpdate && !controller.isTripDay == true
                      ? Column(
                          children: [
                            SizedBox(
                              height: 2.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: CustomMatrerialButton(
                                text: 'بحث',
                                onPressed: () {
                                  controller.search();
                                },
                              ),
                            ),
                          ],
                        )
                      : controller.data.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.asset(
                                    // repeat: false,
                                    AppImageAsset.noData,
                                    width: 80.w,
                                    height: 35.h,
                                  ),
                                  Text(
                                    'لا يوجد رحلات',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.sp),
                                  ),
                                ],
                              ),
                            )
                          : ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return CardForResultSearch(
                                  date: DateFormat('yyyy/MM/dd').format(
                                      DateTime.parse(controller.data[index]
                                          ['Start_Date'])),
                                  startTime: controller.data[index]
                                      ['Start_Time'],
                                  endTime: controller.data[index]['End_Time'],
                                  startCity: controller.data[index]
                                      ['Start_City']['name'],
                                  endCity: controller.data[index]['End_City']
                                      ['name'],
                                  nameCompany: controller.data[index]['company']
                                          ['Companyname']
                                      .toString(),
                                  numChairs: controller.data[index]
                                          ['AvailableChairs']
                                      .toString(),
                                  numTrip: '${index + 1}',
                                  priceTicket: controller.data[index]['Price']
                                      .toString(),
                                  stateTrip: true,
                                  // controller.stateTrip,
                                  onSwitch: (val) {
                                    // controller.onChangeStateTrip(index, val);
                                    controller.canceledTrip(
                                        controller.data[index]['id'], index);
                                  },
                                  onPressed: () {
                                    Get.to(() => AddNewReservationScreen(),
                                        arguments: controller.data[index]
                                            ['id']);
                                    // Get.to(
                                    //     () => SwitchScreen(
                                    //           indexScreen: 4,
                                    //         ),
                                    //     arguments: controller.data[index]
                                    //         ['id']);
                                    // print(
                                    //     "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLZZZZZZZZZZZZZZZZZZZZZZzz");
                                    // print(controller.data);
                                    // print(controller.data[index]['id']);
                                    // print(
                                    //     "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLZZZZZZZZZZZZZZZZZZZZZZzz");
                                  },
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 0.3.h,
                                );
                              },
                              itemCount: controller.data.length),
                ),
              ],
            ),
          ));
    });
  }
}
