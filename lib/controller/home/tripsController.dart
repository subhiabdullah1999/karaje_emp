import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/changeFormatTime.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/tripsData.dart';

class TripsController extends GetxController {
  List data = [];
  List dataForDay = [];
  List dataForAutherDay = [];

  Map city = {};
  List listCity = [];
  bool stateTrip = true;
  bool isTripDay = true;
  bool isUpdate = true;
  DateTime date2 = DateTime.now();
  TextEditingController? date;
  TextEditingController? timeController;
  var selectedStartCity, selectedEndCity;
  int? startCityId, endCityId;
  int? startCityIdTemp, endCityIdTemp;
  String? lastDate;
  TimeOfDay time =
      TimeOfDay(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute);
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  TripsData tripsData = TripsData(Get.find());

  @override
  void onInit() async {
    await getTripForEmployeeToday();
    await getCity();
    date = TextEditingController(text: changeFormatDate(date2).toString());
    lastDate = changeFormatDate(date2).toString();
    timeController = TextEditingController(
        text: changeFormatTimeForBackEnd(time).toString());
    super.onInit();
  }

  selectCity(val, type) {
    if (type == 1) {
      selectedStartCity = val;
      startCityId = city[selectedStartCity];
      if (startCityIdTemp != startCityId) {
        startCityIdTemp = startCityId;
        isUpdate = true;
      }
    } else {
      selectedEndCity = val;
      endCityId = city[selectedEndCity];
      if (endCityIdTemp != endCityId) {
        endCityIdTemp = endCityId;
        isUpdate = true;
      }
    }

    update();
  }

  onChangeStateTrip(index, val) {
    stateTrip = val;
    update();
  }

  onChangeDay(val) {
    isTripDay = val;
    if (val) {
      data = dataForDay;
    } else {
      data = dataForAutherDay;
    }
    update();
  }

  showCalender(context) {
    showDatePicker(
            context: context,
            initialDate: date2,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 30)))
        .then((DateTime? value) {
      if (value != null) {
        date = TextEditingController(text: changeFormatDate(value).toString());
        if (date!.text != lastDate) {
          lastDate = date!.text;
          isUpdate = true;
        }
        update();
      }
      // ignore: avoid_print
      print(value);
    });
  }

  void customShowTimePicker(context) {
    showTimePicker(context: context, initialTime: time).then((value) {
      if (value == null) {
        return;
      } else {
        time = value;
        timeController = TextEditingController(
            text: changeFormatTimeForBackEnd(time).toString());
        print(changeFormatTimeForBackEnd(time));
        update();
      }
    });
    update();
  }

  checkUpdateDate() {
    if (date!.text != lastDate) {
      lastDate = date!.text;
      isUpdate = true;
      update();
    }
  }

  canceledTrip(id, index) async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await tripsData.canceledTrip(id.toString());
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      Map data = {};
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);
        print(data);
        if (data["status"] == true) {
          if (isTripDay) {
            dataForDay.removeAt(index);
            this.data = dataForDay;
          } else {
            dataForAutherDay.removeAt(index);
            this.data = dataForAutherDay;
          }
          print(data.length);
          update();
        } else {
          return Get.snackbar("فشل", '',
              colorText: Colors.white,
              backgroundColor: Colors.red.withOpacity(0.7),
              duration: const Duration(seconds: 3));
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("فشل", "تحقق من الاتصال بالانترنت");
      }
    }
  }

  getCity() async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await tripsData.getcities();
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      Map data = {};
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);
        print(data);
        if (data["status"] == true) {
          for (int i = 0; i < data['data']['Cities'].length; i++) {
            listCity.add(data['data']['Cities'][i]['name']);
            city.addAll({
              data['data']['Cities'][i]['name']: data['data']['Cities'][i]['id']
            });
          }
          print(city);
          print(listCity);
        } else {
          return Get.snackbar("فشل", 'لا يوجد رحلات متوفرة في هذا اليوم',
              colorText: Colors.white,
              backgroundColor: Colors.red.withOpacity(0.7),
              duration: const Duration(seconds: 3));
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("فشل", "تحقق من الاتصال بالانترنت");
      }
    }
  }

  search() async {
    var date1 = DateFormat('yyyy/MM/dd').parse(date!.text);
    if (startCityId == endCityId) {
      return Get.snackbar(
          "فشل", "لا يمكن ان تكون نقطة الانطلاق نفسها نقطة الوجهة",
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    } else if (DateFormat('yyyy/MM/dd').parse(date!.text).isBefore(date2) &&
        !(date1.year == date2.year &&
            date1.month == date2.month &&
            date1.day == date2.day)) {
      return Get.snackbar("فشل", "لا يمكن ان يكون التاريخ في الماضي ",
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    } else if (startCityId != null && endCityId != null && date != null) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await tripsData.searchData(
          startCityId.toString(),
          endCityId.toString(),
          '${date!.text.split('/')[0]}-${date!.text.split('/')[1]}-${date!.text.split('/')[2]}');
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      Map data = {};
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);
        print(data['status']);
        if (data["status"] == true) {
          dataForAutherDay = data['data']['Trips'];
          this.data = dataForAutherDay;
          // print(Reservation.fromJson(this.data[1]['Reservations'][0]).client.mobile);
          isUpdate = false;
          update();
        } else {
          return Get.snackbar("فشل", 'لا يوجد رحلات متوفرة في هذا اليوم',
              colorText: Colors.white,
              backgroundColor: Colors.red.withOpacity(0.7),
              duration: const Duration(seconds: 3));
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("فشل", "تحقق من الاتصال بالانترنت");
      }
    } else {
      return Get.snackbar("فشل", 'يجب ملئ جميع الحقول',
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    }
  }

  getTripForEmployeeToday() async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await tripsData.searchForTodayData();
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      Map data = {};
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);
        print(data['status']);
        if (data["status"] == true) {
          dataForDay = data['data']['Trips'];
          this.data = dataForDay;
        } else {
          return Get.snackbar("فشل", 'لا يوجد حجوزات متوفرة',
              colorText: Colors.white,
              backgroundColor: Colors.red.withOpacity(0.7),
              duration: const Duration(seconds: 3));
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("فشل", "تحقق من الاتصال بالانترنت");
      }
    }
  }
}
