import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajeapp/core/class/handlingdataview.dart';
import 'package:karajeapp/view/widget/home/customMatrerialButton.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/home/passengerController.dart';
import '../../widget/home/customDropDownbotton.dart';
import '../../widget/home/customTextFormFieldWithMask.dart';
import '../../widget/home/tableForPassenger.dart';

class PassengerScreen extends StatelessWidget {
  const PassengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PassengerController());
    return GetBuilder<PassengerController>(builder: (controller) {
      return HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                width: 100.w,
                child: Column(
                  children: [
                    SizedBox(
                      height: 6.h,
                      child: CustomTextFormFieldWithMask(
                        labelText: 'تاريخ الرحلة',
                        readOnly: true,
                        mask: '####/##/##',
                        onTap: () {
                          controller.showCalender(context);
                        },
                        controller: controller.date!,
                        icon: Icons.calendar_month,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    controller.listTimes.isEmpty
                        ? const SizedBox()
                        : SizedBox(
                            height: 10.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("اختر الوجهة والوقت",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54)),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomDropDownButton2(
                                    onChanged: (val) {
                                      controller.selectTime(val);
                                    },
                                    hint: 'وقت انطلاق الرحلة',
                                    listData: controller.listTimes,
                                    isSelected: controller.isSelectTime),
                              ],
                            ),
                          ),
                    SizedBox(
                      height: 2.h,
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 5.w),
                    //   child: CustomMatrerialButton(
                    //     text: 'بحث',
                    //     onPressed: () {
                    //       controller.search();
                    //     },
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              (controller.data.isNotEmpty &&
                          controller.data[controller.index].isEmpty) ||
                      (controller.data.isEmpty)
                  ? SizedBox(
                      height: 65.h,
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
                  : Column(
                      children: [
                        TableForPassenger(
                            data: controller.data.length > controller.index
                                ? controller.data[controller.index]
                                : []),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          child: CustomMatrerialButtonWidget(
                            widget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('تحميل',
                                    style: TextStyle(
                                        fontSize: 13.sp, color: Colors.white)),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Icon(Icons.save_alt_outlined,
                                    size: 20.sp, color: Colors.white)
                              ],
                            ),
                            onPressed: () {
                              controller.generatePDF(controller.index);
                            },
                          ),
                        )
                      ],
                    )
            ],
          ));
    });
  }
}
