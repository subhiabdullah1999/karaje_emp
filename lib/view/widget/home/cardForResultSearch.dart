import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constant/imgaeasset.dart';
import '../../../controller/home/AddNewReservation_Controller.dart';
import 'RowTextWidget.dart';
import 'customMatrerialButton.dart';

class CardForResultSearch extends StatelessWidget {
  final void Function()? onPressed;
  final String startCity;
  final String endCity;
  final String startTime;
  final String endTime;
  final String numChairs;
  final String priceTicket;
  final String nameCompany;
  final String numTrip;
  final String date;
  final bool stateTrip;
  final void Function(bool)? onSwitch;

  const CardForResultSearch({
    super.key,
    this.onPressed,
    required this.startCity,
    required this.endCity,
    required this.startTime,
    required this.endTime,
    required this.numChairs,
    required this.priceTicket,
    required this.nameCompany,
    required this.numTrip,
    required this.date,
    required this.stateTrip,
    this.onSwitch,
  });

  @override
  Widget build(BuildContext context) {
    final AddNewReservationControllerImp addNewReservationController =
        Get.put(AddNewReservationControllerImp());
    return SizedBox(
      height: 48.h,
      width: 100.w,
      child: Card(
          color: stateTrip == true ? Colors.white : Colors.black26,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.5.w)),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.5.w),
              child: Column(children: [
                SizedBox(
                  height: 8.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          nameCompany,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(color: Colors.black, fontSize: 12.sp),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(stateTrip == true
                                    ? AppImageAsset.numTrip1
                                    : AppImageAsset.numTrip2))),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 0.3.h,
                            ),
                            Text(
                              'رقم الرحلة',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 7.sp),
                            ),
                            Text(
                              numTrip.toString(),
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Switch(
                            value: stateTrip,
                            onChanged: onSwitch,
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 55.w,
                      child: Column(
                        children: [
                          RowTextWidget(
                            type: stateTrip == true ? 1 : null,
                            text1: 'التاريخ',
                            text2: date,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          RowTextWidget(
                            type: stateTrip == true ? 1 : null,
                            text1: 'وقت الرحلة',
                            text2: addNewReservationController
                                .formatTime(startTime),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          RowTextWidget(
                            type: stateTrip == true ? 1 : null,
                            text1: 'وقت الوصول',
                            text2:
                                addNewReservationController.formatTime(endTime),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          RowTextWidget(
                            type: stateTrip == true ? 1 : null,
                            text1: 'المقاعد المتاحة',
                            text2: numChairs,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          RowTextWidget(
                            type: stateTrip == true ? 1 : null,
                            text1: 'سعر التذكرة',
                            text2: priceTicket,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    SizedBox(
                      height: 25.h,
                      width: 19.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                startCity,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 13.sp),
                              ),
                              Icon(
                                Icons.person,
                                size: 20.sp,
                                color: Colors.black45,
                              ),
                            ],
                          ),
                          Image.asset(
                            stateTrip == true
                                ? AppImageAsset.vector1
                                : AppImageAsset.vector2,
                            width: 3.w,
                            height: 8.h,
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.place,
                                size: 20.sp,
                                color: Colors.black45,
                              ),
                              Text(
                                endCity,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 13.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: CustomMatrerialButton(
                    state: stateTrip == true ? null : true,
                    text: 'احجز',
                    onPressed: onPressed,
                  ),
                )
              ]))),
    );
  }
}
