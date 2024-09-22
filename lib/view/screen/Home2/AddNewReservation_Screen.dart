import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Home/AddNewReservation_Controller.dart';
import '../../../controller/home/DropDownController.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../../../core/services/services.dart';
import '../../widget/Auth/Auth_Button(WithoutCheckBox).dart';
import '../../widget/Auth/Custom_TextField.dart';
import '../../widget/Home2/ReservationTextField.dart';
import '../../widget/Home2/Trips_DropDown.dart';
import '../../widget/Home2/customDropDownbotton.dart';
import 'ChairsReserve_Screen.dart';
import 'e_cash.dart';

class AddNewReservationScreen extends StatelessWidget {
  const AddNewReservationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    Get.put(AddNewReservationControllerImp());
    DropDownController dropDownController2 = Get.put(DropDownController());

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Text(
      //     "حجز لمسافر",
      //     style: const TextStyle(
      //       color: Colors.black,
      //       fontFamily: 'Cairo',
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           Get.back();
      //         },
      //         icon: Icon(
      //           Icons.arrow_forward_ios,
      //           color: Colors.black,
      //           size: 15.sp,
      //         )),
      //   ],
      // ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: GetBuilder<AddNewReservationControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formstate,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ReservationTextField(
                      labelText: 'تاريخ الحجز ',
                      controller: controller.ReservationDate,
                    ),
                    TripsDropDown(
                      labelText: 'رقم الرحلة',
                      controller: controller.trip_name,
                    ),
                    controller.trip_id == 0.obs
                        ? SizedBox()
                        : Directionality(
                            textDirection: TextDirection.rtl,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(6.w, 0, 6.w, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'رقم المقاعد',
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
                                    child: TextFormField(
                                      onTap: () {
                                        Get.to(const ChairsReserveScreen());
                                      },
                                      keyboardType: TextInputType.none,
                                      decoration: InputDecoration(
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide:
                                              BorderSide(color: AppColor.grey),
                                        ),
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide:
                                              BorderSide(color: AppColor.grey),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              color: AppColor.orange),
                                        ),
                                        hintText:
                                            controller.selectedIndices.isEmpty
                                                ? 'إختر المقعد'
                                                : controller.selectedIndices
                                                    .join(', '),
                                        hintStyle: TextStyle(
                                          fontFamily: 'Cairo',
                                          color: Colors.grey,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 1.h,
                    ),
                    CustomTextField(
                      valid: (val) {
                        return validInput(val!, 2, 25, "");
                      },
                      controller: controller.name,
                      keyboardType: TextInputType.name,
                      labelText: 'الاسم',
                      hintText: 'محمد  الأحمد',
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    CustomTextField(
                      valid: (val) {
                        return validInput(val!, 10, 11, "");
                      },
                      controller: controller.idNumber,
                      keyboardType: TextInputType.number,
                      labelText: 'الرقم الوطني',
                      hintText: '12000000000',
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    CustomTextField(
                      onChanged: (val) {
                        controller.phoneNumber = val;
                      },
                      valid: (val) {
                        return validInput(val!, 10, 10, "");
                      },
                      controller: controller.phone,
                      keyboardType: TextInputType.number,
                      labelText: 'رقم الهاتف',
                      hintText: '09########',
                    ),
                    CustomDropDownButton3(
                      hintText: 'وسيلة الدفع',
                      listData: controller.methodePaymintList,
                      isSelected: controller.isSelected,
                      onChanged: (val) {},
                      labelText: 'وسيلة الدفع',
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 6.h, 0, 2.h),
                      child: AuthButtonWithoutCheckBox(
                        buttonText: 'إضافة',
                        onPressed: () async {
                          print("111111111111111111111111111111111111111");
                          final price = await myServices.sharedPreferences
                              .getString("Price");
                          final totalPrice = controller.selectedIndices.length *
                              1.5 *
                              int.parse('${price}');
                          final totalPriceAsInt = totalPrice.toInt();

                          controller.selectedIndices.isEmpty
                              ? Get.snackbar(
                                  "فشل", ' يجب حجز مقعد واحد على الأقل',
                                  colorText: Colors.white,
                                  backgroundColor: Colors.red.withOpacity(0.7),
                                  duration: const Duration(seconds: 3))
                              : controller.addNewReservation(context);
                          //  dropDownController2.selectedValue ==
                          //         'الدفع نقدا'
                          //     ? controller.addNewReservation(context)
                          //     : dropDownController2.selectedValue ==
                          //             'إي-كاش'
                          //         ? Get.to(Ecash(price: '$totalPriceAsInt'))
                          //         : null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
