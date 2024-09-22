import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:karajeapp/core/class/handlingdataview.dart';
import 'package:karajeapp/core/constant/color.dart';
import 'package:karajeapp/core/constant/imgaeasset.dart';
import 'package:karajeapp/view/widget/home/RowTextWidget.dart';
import 'package:karajeapp/view/widget/home/customMatrerialButton.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/home/searchForIdORMobileController.dart';
import '../../../core/functions/validinput.dart';
import '../../../data/model/ticketModel.dart';
import '../../widget/home/CustomTextField.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchForIdORMobileController());
    return GetBuilder<SearchForIdORMobileController>(builder: (controller) {
      return HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.5.w),
            child: ListView(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Form(
                  key: controller.formstate,
                  child: CustomTextField(
                    mask: '##########',
                    valid: (val) {
                      return validInput(val!, 10, 11, "none");
                    },
                    controller: controller.controller,
                    keyboardType: TextInputType.phone,
                    labelText: 'رقم الموبايل أو الرقم الوطني',
                    hintText: 'رقم الموبايل أو الرقم الوطني',
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                  child: CustomMatrerialButton(
                    text: 'بحث',
                    onPressed: () {
                      controller.search();
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                controller.data.isEmpty
                    ? SizedBox(
                        height: 55.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('لا يوجد حجوزات حتى الان',
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.black.withOpacity(0.5))),
                          ],
                        ),
                      )
                    : ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Dismissible(
                              key: UniqueKey(), // Unique key for each item
                              onDismissed: (direction) {
                                // Handle dismiss action
                                if (direction == DismissDirection.endToStart) {
                                  // Handle swipe from end to start (right to left)
                                  controller.canceleCart(
                                      TripModel.fromJson(controller.data[index])
                                          .id
                                          .toString());
                                }
                              },
                              direction: DismissDirection
                                  .horizontal, // Specify horizontal swipe
                              background: Container(
                                color: Colors.green,
                                alignment: Alignment.centerLeft,
                                child: const Icon(
                                  Icons.archive,
                                  color: Colors.white,
                                ),
                              ),
                              secondaryBackground: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              child: Container(
                                height: 30.h,
                                padding: EdgeInsets.only(right: 7.w, left: 4.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.transparent,
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          AppImageAsset.card,
                                        ),
                                        fit: BoxFit.cover)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        width: 40.w,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            RowTextWidget2(
                                                text1: 'الانطلاق من',
                                                text2: controller.data[index]
                                                        ["Trip"]['Start_City']
                                                    ['name'],
                                                // TripModel.fromJson(
                                                //         controller.data[index])
                                                //     .trip
                                                //     .startCity
                                                //     .name,
                                                type: 1),
                                            SizedBox(
                                              height: 0.2.h,
                                            ),
                                            RowTextWidget2(
                                                text1: 'الوصول الى',
                                                text2: controller.data[index]
                                                        ["Trip"]['End_City']
                                                    ['name'],
                                                // TripModel.fromJson(
                                                //         controller.data[index])
                                                //     .trip
                                                //     .endCity
                                                //     .name,
                                                type: 1),
                                            SizedBox(
                                              height: 0.2.h,
                                            ),
                                            RowTextWidget2(
                                                text1: 'وقت الانطلاق',
                                                text2: controller.data[index]
                                                    ["Trip"]['Start_Time'],
                                                // TripModel.fromJson(
                                                //         controller.data[index])
                                                //     .trip
                                                //     .startTime,
                                                type: 1),
                                            SizedBox(
                                              height: 0.2.h,
                                            ),
                                            RowTextWidget2(
                                                text1: 'وقت الوصول',
                                                text2: controller.data[index]
                                                    ["Trip"]['End_Time'],
                                                // TripModel.fromJson(
                                                //         controller.data[index])
                                                //     .trip
                                                //     .endTime,
                                                type: 1),
                                            SizedBox(
                                              height: 0.2.h,
                                            ),
                                            RowTextWidget2(
                                                text1: 'تاريخ الرحلة',
                                                text2: controller.data[index]
                                                    ["date"],
                                                // TripModel.fromJson(
                                                //         controller.data[index])
                                                //     .date,
                                                type: 1),
                                            SizedBox(
                                              height: 0.2.h,
                                            ),
                                            // RowTextWidget2(
                                            //     text1: 'مدة الرحلة',
                                            //     text2: DateFormat('HH:mm').format(DateTime(
                                            //         0,
                                            //         0,
                                            //         0,
                                            //         DateFormat('HH:mm')
                                            //             .parse(TripModel.fromJson(controller.data[index])
                                            //                 .trip
                                            //                 .endTime)
                                            //             .difference(
                                            //                 DateFormat('HH:mm').parse(
                                            //                     TripModel.fromJson(controller.data[index])
                                            //                         .trip
                                            //                         .startTime))
                                            //             .inHours,
                                            //         DateFormat('HH:mm')
                                            //             .parse(
                                            //                 TripModel.fromJson(controller.data[index])
                                            //                     .trip
                                            //                     .endTime)
                                            //             .difference(
                                            //                 DateFormat('HH:mm')
                                            //                     .parse(TripModel.fromJson(controller.data[index]).trip.startTime))
                                            //             .inMinutes
                                            //             .remainder(60))),
                                            //     type: 1),
                                            SizedBox(
                                              height: 0.2.h,
                                            ),
                                            RowTextWidget2(
                                                text1: 'سعر التذكرة',
                                                text2: controller.data[index]
                                                        ["totalPrice"]
                                                    // TripModel.fromJson(
                                                    //         controller.data[index])
                                                    //     .totalPrice
                                                    .toString(),
                                                type: 1),
                                            SizedBox(
                                              height: 0.2.h,
                                            ),
                                            RowTextWidget2(
                                                text1: 'رقم المقعد',
                                                text2: controller.data[index]
                                                        ["NumChairs"]
                                                    // TripModel.fromJson(
                                                    //         controller.data[index])
                                                    //     .numChairs
                                                    .join(', ')
                                                    .toString(),
                                                type: 1),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 3.w),
                                      height: 25.h,
                                      width: 1,
                                      color: Colors.black12,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          PrettyQr(
                                            typeNumber: 3,
                                            size: 15.h,
                                            data: controller.data[index]["id"]
                                                //  TripModel.fromJson(
                                                //         controller.data[index])
                                                //     .id
                                                .toString(),
                                            elementColor: controller.data[index]
                                                        ["staus"] ==
                                                    //  TripModel.fromJson(
                                                    //                 controller
                                                    //                     .data[index])
                                                    //             .status ==
                                                    'completed'
                                                ? Colors.black
                                                : AppColor.orange,
                                            errorCorrectLevel:
                                                QrErrorCorrectLevel.M,
                                            roundEdges: true,
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            controller.data[index]["status"] ==
                                                    'completed'
                                                // TripModel.fromJson(controller
                                                //                 .data[index])
                                                //             .status ==
                                                //         'completed'
                                                ? 'صالحة'
                                                : 'غير صالحة',
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color:
                                                    // TripModel.fromJson(
                                                    //                 controller.data[
                                                    //                     index])
                                                    //             .status ==
                                                    //         'completed'
                                                    controller.data[index]
                                                                ["status"] ==
                                                            'completed'
                                                        ? Colors.black
                                                        : AppColor.orange),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 1.5.h,
                          );
                        },
                        itemCount: controller.data.length)
              ],
            ),
          ));
    });
  }
}
