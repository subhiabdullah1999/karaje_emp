import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/searchData.dart';
import '../../data/model/ticketModel.dart';

class SearchForIdORMobileController extends GetxController {
  List data = [];

  TextEditingController controller = TextEditingController();
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState>? formstate = GlobalKey<FormState>();

  SearchData searchData = SearchData(Get.find());

  @override
  void onInit() {
    super.onInit();
  }

  search() async {
    if (formstate!.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await searchData.searchData(controller.text.toString());
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      Map data = {};
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);
        print(data['status']);
        if (data["status"] == true) {
          this.data = data['data']['Reservations'].reversed.toList() as List;
          print("dddddddddddddssssseeee8888888888888888888888888888888");
          print(data);
          TripModel.fromJson(data[0]).trip.startCity.name;
          print("dddddddddddddssssseeee8888888888888888888888888888888");
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

  canceleCart(id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await searchData.canceledReservationData(id);
    print("=============================== response $response ");
    print("=============================== statusRequest $statusRequest ");
    statusRequest = handlingData(response);
    update();
    Map data = {};
    if (StatusRequest.success == statusRequest) {
      data.addAll(response);
      print(data['status']);
      if (data["status"] == true) {
        Get.back();
        return Get.snackbar("نجح", 'تم الغاء الحجز بنجاح',
            colorText: Colors.white,
            backgroundColor: Colors.green.withOpacity(0.7),
            duration: const Duration(seconds: 3));
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
