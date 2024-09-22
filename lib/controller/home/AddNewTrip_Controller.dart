import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:karajeapp/view/screen/home/mainscreen.dart';
import 'package:sizer/sizer.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import '../../data/datasource/remote/Home/addNewTrip_Data.dart';
import '../../view/widget/Auth/Auth_Button(WithoutCheckBox).dart';

abstract class AddNewTripController extends GetxController {
  addNewTrip();

  getallDrivers_cities();
}

class AddNewTripControllerImp extends AddNewTripController {
  AddNewTripData addNewTripData = AddNewTripData(Get.find());
  List drivers = [];
  List cities = [];

  var selectedDriverId = 0.obs;
  var selectedDriverName = 0.obs;
  late TextEditingController numBus;
  var selectedFromCity = 0.obs;
  var selectedToCity = 0.obs;
  var selectedFromCityId = 0.obs;
  var selectedToCityId = 0.obs;
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedSEndDate = DateTime.now();
  late TextEditingController price;
  late TextEditingController numChairs;
  // late TextEditingController numChairs;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  // var selectedNumChairs = '0'.obs;

  var isClick = false.obs;

  List<DateTime> selectedDates = [];

  void updateSelectedDates(List<DateTime> dates) {
    for (DateTime date in dates) {
      if (selectedDates.contains(date)) {
        selectedDates.remove(date);
        update();
      } else {
        selectedDates.add(date);
        update();
      }
    }
    update();
  }

  void updateisClick(bool value) {
    isClick.value = value;
    update();
  }

  // void updateSelectedNumChairs(String item) {
  //   selectedNumChairs.value = item;
  //   update();
  // }

  void updateSelectedStartTime(DateTime time) {
    selectedStartDate = time;
    update();
  }

  void updateSelectedEndTime(DateTime time) {
    selectedSEndDate = time;
    update();
  }

  void updateSelectedDriverId(int item) {
    selectedDriverId = item.obs;
    update();
  }

  void updateSelectedDriverName(int item) {
    selectedDriverName = item.obs;
    update();
  }

  void updateSelectedFromCity(int item) {
    selectedFromCity = item.obs;
    update();
  }

  void updateSelectedToCity(int item) {
    selectedToCity = item.obs;
    update();
  }

  void updateSelectedFromCityId(int item) {
    selectedFromCityId = item.obs;
    update();
  }

  void updateSelectedToCityId(int item) {
    selectedToCityId = item.obs;
    update();
  }

  @override
  addNewTrip() async {
    List<String> selectedDateStrings = selectedDates
        .map((date) => DateFormat('yyyy-MM-dd').format(date))
        .toList();

    if (formstate.currentState!.validate()) {
      updateisClick(true);
      //statusRequest = StatusRequest.loading;
      update();

      var response = await addNewTripData.addTrip(
        selectedDriverId.toString(),
        '${myServices.sharedPreferences.getString("user_id")}',
        selectedFromCity.toString(),
        selectedToCity.toString(),
        price.text,
        numChairs.text,
        numBus.text,
        selectedStartDate.toString(),
        selectedSEndDate.toString(),
        selectedDateStrings,
        DateFormat('HH:mm').format(selectedStartDate).toString(),
        DateFormat('HH:mm').format(selectedSEndDate).toString(),
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        print("succccccccccccccccccccccccccccccccccccccesssssssssssssssssss");
        if (response['status'] == true) {
          Get.snackbar(
              "تم إضافة الرحلة بنجاح", '${response['data']['Trip']['id']}',
              colorText: AppColor.white,
              backgroundColor: AppColor.orange.withOpacity(0.7),
              duration: const Duration(seconds: 3));
          Get.off(const MainScreen());
        }
      } else {
        updateisClick(false);
        print("erorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
        update();
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.sp),
          ),
          child: SizedBox(
            height: 35.h,
            width: 90.w,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Icon(
                    Icons.info_outline,
                    size: 60.sp,
                    color: AppColor.orange,
                  ),
                ),
                Text(
                  'Oops',
                  style: TextStyle(
                    color: AppColor.greylight,
                    height: 0.2.h,
                    fontSize: 19.sp,
                    fontFamily: 'Cairo',
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'تأكد من تعبئة جميع الحقول بالمعطيات الصحيحة',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.grey,
                    height: 0.2.h,
                    fontSize: 11.sp,
                    fontFamily: 'Cairo',
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Transform.scale(
                  scaleY: 0.1.h,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15.w, 2.h, 15.w, 1.h),
                    child: AuthButtonWithoutCheckBox(
                      buttonText: 'Ok',
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      update();
    } else {
      print(
          "erorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsssssssssssssssssssssss");
    }
  }

  @override
  getallDrivers_cities() async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addNewTripData.getdrivers();
      var response1 = await addNewTripData.getcities();
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        Map mapData = {};
        mapData.addAll(response);
        Map mapData2 = {};
        mapData2.addAll(response1);
        if (mapData["status"] == true && mapData2["status"] == true) {
          drivers = mapData['data']['Employees'];
          cities = mapData2['data']['Cities'];
          return true;
        } else {
          return Get.snackbar("فشل", 'لا يوجد سائقين',
              colorText: AppColor.white,
              backgroundColor: AppColor.orange.withOpacity(0.7),
              duration: const Duration(seconds: 3));
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar(
            "تحذير", "انت غير متصل بالانترنت يرجى التحقق من ذلك");
      } else if (statusRequest == StatusRequest.serverfailure) {
        return Get.snackbar(
          "تحذير",
          "حدث خطأ غير متوقع",
          backgroundColor: AppColor.red.withOpacity(0.7),
          colorText: AppColor.white,
        );
      }
    }
  }

  @override
  void onInit() {
    getallDrivers_cities();
    drivers;
    selectedDriverId;
    selectedDriverName;
    selectedFromCity;
    selectedToCity;
    numBus = TextEditingController();
    price = TextEditingController();
    numChairs = TextEditingController();
    // selectedNumChairs = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    getallDrivers_cities();
    drivers;
    selectedDriverId;
    selectedDriverName;
    selectedFromCity;
    selectedToCity;
    numBus.dispose();
    price.dispose();
    numChairs.dispose();
    super.dispose();
  }
}
