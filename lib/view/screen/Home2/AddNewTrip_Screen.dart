import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Home/AddNewTrip_Controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/Auth/Auth_Button(WithoutCheckBox).dart';
import '../../widget/Auth/Custom_TextField.dart';
import '../../widget/Home2/FromCities_DropDown.dart';
import '../../widget/Home2/Driver_DropDown.dart';
import '../../widget/Home2/EndTime_TextField.dart';
import '../../widget/Home2/HolidaysTextField.dart';
import '../../widget/Home2/NumChairs_DropDown.dart';
import '../../widget/Home2/StartTime_TextField.dart';
import '../../widget/Home2/ToCities_DropDown.dart';

class AddNewTripScreen extends StatelessWidget {
  const AddNewTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddNewTripControllerImp());

    return Directionality(
        textDirection: TextDirection.ltr,
        child: GetBuilder<AddNewTripControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formstate,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DriverDropDown(
                      labelText: 'اسم السائق',
                      controller: controller.selectedDriverName,
                    ),
                    CustomTextField(
                      valid: (val) {
                        if (val!.length == null) {
                          return "رقم الباص لا يمكن ان يكون فارغا";
                        } else if (val.length > 100) {
                          return "رقم الباص غير صالح";
                        }
                      },
                      controller: controller.numBus,
                      keyboardType: TextInputType.number,
                      labelText: 'رقم الباص',
                      hintText: 'أكتب رقم الباص',
                    ),
                    FromCitiesDropDown(
                      labelText: 'من',
                      controller: controller.selectedFromCity,
                    ),
                    ToCitiesDropDown(
                      labelText: 'إلى',
                      controller: controller.selectedToCity,
                    ),
                    StartTimeTextField(
                      labelText: 'وقت بداية الرحلة',
                      controller: controller.selectedStartDate,
                    ),
                    EndTimeTextField(
                      labelText: 'وقت نهاية الرحلة',
                      controller: controller.selectedSEndDate,
                    ),
                    const HolidaysTextField(
                      labelText: 'أيام عطلة الرحلة ',
                    ),
                    CustomTextField(
                      valid: (val) {
                        return validInput(val!, 1, 6, "none");
                      },
                      controller: controller.price,
                      keyboardType: TextInputType.number,
                      labelText: 'سعر التذكرة',
                      hintText: 'أكتب سعر التذكرة',
                    ),
                    // const NumChairsDropDown(
                    //   labelText: 'عدد مقاعد الباص',
                    // ),
                    SizedBox(
                      height: 1.h,
                    ),

                    CustomTextField(
                      valid: (val) {
                        if (val!.length == null) {
                          return "رقم المقاعد لا يمكن ان يكون فارغا";
                        } else if (val.length == 1) {
                          return "رقم المقاعد غير صالح";
                        } else if (val.length > 2) {
                          return "رقم المقاعد غير صالح";
                        }
                      },
                      controller: controller.numChairs,
                      keyboardType: TextInputType.number,
                      labelText: 'عدد مقاعد الباص',
                      hintText: 'أكتب عدد مقاعد الباص',
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5.h, 0, 2.h),
                      child: AuthButtonWithoutCheckBox(
                        buttonText: 'إضافة',
                        onPressed: () async {
                          // print(controller. selectedDates
                          //     .map((index) => DateFormat('yyyy:MM:DD').format(index).toString())
                          //     .toList(),);
                          controller.addNewTrip();
                          print(
                              "trrrrrrrrrrrrrrrreeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
                          print(controller.numChairs.text);
                          print(
                              "trrrrrrrrrrrrrrrreeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
