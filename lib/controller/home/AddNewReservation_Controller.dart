import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/services/services.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/Home/AddNewReservation_data.dart';
import '../../view/screen/home/mainscreen.dart';

abstract class AddNewReservationController extends GetxController {
  addNewReservation(BuildContext context);

  getTrips();
}

class AddNewReservationControllerImp extends AddNewReservationController {
  AddNewReservationData addNewEmployeeData = AddNewReservationData(Get.find());

  var trip_id = 0.obs;
  var trip_name = 0.obs;
  late TextEditingController num_chairs;
  late TextEditingController name;
  late TextEditingController idNumber = TextEditingController();
  late TextEditingController phone = TextEditingController();

  String? phoneNumber;
  String? numberCard;
  String? fromCity;
  String? toCity;
  String? dateTimeTrav;
  String? hourTime;

  List methodePaymintList = [
    'الدفع نقدا',
    // 'إي-كاش',
    // 'سيريتيل كاش',
    // 'إم تي إن كاش',
    // 'سدادي'
  ];
  var isSelected;
  List trips = [];
  List chairs = [];

  List<DateTime> ExceptDate = [];

  Rx<DateTime> reservationDate = DateTime.now().obs;

  void updateReservationDate(DateTime date) {
    reservationDate.value = date;
    update();
    print(reservationDate.value);
  }

  // Define a getter for ReservationDate
  DateTime get ReservationDate => reservationDate.value;

  void updateSelectedTripId(int item) {
    trip_id = item.obs;
    update();
  }

  void updateSelectedTripName(int item) {
    trip_name = item.obs;
    update();
  }

  String formatTime(String timeStr) {
    TimeOfDay time = TimeOfDay(
      hour: int.parse(timeStr.split(':')[0]),
      minute: int.parse(timeStr.split(':')[1]),
    );

    String formattedHour = '';
    String formattedMinute = '';

    if (time.hour < 12) {
      formattedHour = '${time.hour}';
    } else if (time.hour == 12) {
      formattedHour = '${time.hour}';
    } else {
      formattedHour = '${time.hour - 12}';
    }

    formattedMinute = time.minute.toString().padLeft(2, '0');

    String period = time.hour < 12 ? 'ص' : 'م';

    return '$formattedHour:$formattedMinute $period';
  }

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  final firstNumbersSelected =
      <bool>[false, false, false, false, false, false, false, false, false].obs;
  final secondNumbersSelected =
      <bool>[false, false, false, false, false, false, false, false, false].obs;
  final thirdNumbersSelected =
      <bool>[false, false, false, false, false, false, false, false, false].obs;
  final forthNumbersSelected =
      <bool>[false, false, false, false, false, false, false, false, false].obs;
  final selectedIndices = <int>[].obs;

  var isClick = false.obs;

  void updateisClick(bool value) {
    isClick.value = value;
    update();
  }

  void toggleFirstNumberSelection(int index) {
    firstNumbersSelected[index] = !firstNumbersSelected[index];
    update();
  }

  void toggleSecondNumberSelection(int index) {
    secondNumbersSelected[index] = !secondNumbersSelected[index];
    update();
  }

  void toggleThirdNumberSelection(int index) {
    thirdNumbersSelected[index] = !thirdNumbersSelected[index];
    update();
  }

  void toggleForthNumberSelection(int index) {
    forthNumbersSelected[index] = !forthNumbersSelected[index];
    update();
  }

  void updateSelectedIndices(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
    } else {
      selectedIndices.add(index);
    }
    update();
  }

  sendMessagevireficationReservation() async {
    await addNewEmployeeData.sendMessageFivicationResData(
        phoneNumber!,
        numberCard!,
        fromCity!,
        toCity!,
        dateTimeTrav!.toString(),
        hourTime!.toString());
  }

  @override
  addNewReservation(BuildContext context) async {
    if (formstate.currentState!.validate()) {
      updateisClick(true);
      update();
      var response = await addNewEmployeeData.postdata(
        trip_id.toString(),
        selectedIndices.map((index) => index.toString()).toList(),
        name.text,
        phone.text,
        '$ReservationDate',
        idNumber.text,
      );
      statusRequest = handlingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == true) {
          updateisClick(false);
          update();
          //await addnotification('test1','test','${mapData['data']['Reservation']['Client']['id']}');
          Get.offAll(const MainScreen());
          name.text = '';
          idNumber.text = '';
          phone.text = '';
          selectedIndices.clear();
          numberCard = response['data']['Reservation']["id"].toString();
          print("ndddddd77777777777777777777777777777777777777777777777");
          fromCity =
              response['data']['Reservation']["Trip"]['Start_City']['name'];
          toCity = response['data']['Reservation']["Trip"]['End_City']['name'];
          String hourTimecomp =
              response['data']['Reservation']["Trip"]['Start_Time'].toString();

          hour:
          int.parse(hourTimecomp.split(':')[0]);
          minute:
          int.parse(hourTimecomp.split(':')[1]);
          DateTime dateTime = DateFormat("HH:mm:ss").parse(hourTimecomp!);
          String formattedHour = '';
          String formattedMinute = '';

          formattedHour = dateTime.hour.toString();

          formattedMinute = dateTime.minute.toString().padLeft(2, '0');
          hourTime = "$formattedHour:$formattedMinute";
          dateTimeTrav = response['data']['Reservation']["date"].toString();
          print(
              "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrxxxxxxxxxxxx");
          print(response['data']['Reservation']["id"]);
          print(response['data']['Reservation']["Trip"]['Start_City']['name']);
          print(response['data']['Reservation']["Trip"]['End_City']['name']);
          print(response['data']['Reservation']["Trip"]['Start_Time']);
          print(hourTime);
          print(response['data']['Reservation']["date"]);

          print(
              "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrxxxxxxxxxxxx");

          await completedRes('${response['data']['Reservation']['id']}');
        }
      } else {
        updateisClick(false);
        update();
        // ignore: use_build_context_synchronously
        AwesomeDialog(
          context: context,
          dialogType: DialogType.WARNING,
          animType: AnimType.BOTTOMSLIDE,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              children: [
                Text(
                  "تأكد من المعلومات المدخلة و أعد المحاولة لاحقا",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Cairo",
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ).show();
      }
      update();
    } else {}
  }

  completedRes(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addNewEmployeeData.completedResData(
      id,
    );
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      Map mapData = {};
      mapData.addAll(response);
      if (mapData["status"] == true) {
        sendMessagevireficationReservation();
        Get.snackbar("تم إضافة الحجز بنجاح", 'رقم الحجز$id',
            colorText: AppColor.white,
            backgroundColor: AppColor.orange.withOpacity(0.7),
            duration: const Duration(seconds: 3));

        //await addnotification('test1','test','${mapData['data']['Reservation']['Client']['id']}');
        Get.off(const MainScreen());

        name.text = '';
        idNumber.text = '';
        phone.text = '';
        selectedIndices.clear();
      } else {}
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Get.snackbar("فشل", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {}
  }

  addNewReservationecash(BuildContext context) async {
    if (formstate.currentState!.validate()) {
      updateisClick(true);
      update();
      var response = await addNewEmployeeData.postdata(
        trip_id.toString(),
        selectedIndices.map((index) => index.toString()).toList(),
        name.text,
        phone.text,
        '${ReservationDate}',
        idNumber.text,
      );
      statusRequest = handlingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == true) {
          updateisClick(false);
          update();
          //await addnotification('test1','test','${mapData['data']['Reservation']['Client']['id']}');
          Get.off(const MainScreen());

          name.text = '';
          idNumber.text = '';
          phone.text = '';
          selectedIndices.clear();
          await payment('${response['data']['Reservation']['id']}');
        }
      } else {
        updateisClick(false);
        update();
        // ignore: use_build_context_synchronously
        AwesomeDialog(
          context: context,
          dialogType: DialogType.WARNING,
          animType: AnimType.BOTTOMSLIDE,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              children: [
                Text(
                  "تأكد من المعلومات المدخلة و أعد المحاولة لاحقا",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Cairo",
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ).show();
      }
      update();
    } else {}
  }

  payment(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addNewEmployeeData.paymentResData(
      id,
    );
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      Map mapData = {};
      mapData.addAll(response);
      if (mapData["status"] == true) {
        Get.snackbar("تم إضافة الحجز بنجاح", 'رقم الحجز$id',
            colorText: AppColor.white,
            backgroundColor: AppColor.orange.withOpacity(0.7),
            duration: const Duration(seconds: 3));

        //await addnotification('test1','test','${mapData['data']['Reservation']['Client']['id']}');
        Get.off(const MainScreen());
        name.text = '';
        idNumber.text = '';
        phone.text = '';
        selectedIndices.clear();
      } else {}
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Get.snackbar("فشل", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {}
  }
  // addnotification(
  //   String type,
  //   String description,
  //   String client_id,
  // ) async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await addNewEmployeeData.addnotification(
  //     type,
  //     description,
  //     client_id,
  //   );
  //   print("=============================== response completedRes $response ");
  //   print("=============================== statusRequest $statusRequest ");
  //   statusRequest = handlingData(response);
  //   update();
  //   if (StatusRequest.success == statusRequest) {
  //     Map mapData = {};
  //     mapData.addAll(response);
  //     if (mapData["status"] == true) {
  //     } else {}
  //   } else if (statusRequest == StatusRequest.offlinefailure) {
  //     return Get.snackbar("فشل", "you are not online please check on it");
  //   } else if (statusRequest == StatusRequest.serverfailure) {}
  // }
  //

  @override
  getTrips() async {
    try {
      statusRequest = StatusRequest.loading;
      update();

      var response = await addNewEmployeeData.getTrips('$ReservationDate');

      statusRequest = handlingData(response);
      update();

      if (statusRequest == StatusRequest.success) {
        Map mapData = Map.from(response); // Use Map.from to create a copy

        if (mapData["status"] == true) {
          trips = mapData['data']['Trips'];
          trips = trips.toList().reversed.toList();
          print("tripwwwwwwwwwwwwwwwwwwwwwwqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
          print(trips);
          print("tripwwwwwwwwwwwwwwwwwwwwwwqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar(
            "تحذير", "أنت لست متصلا بالانترنت يرجى التحقق من ذلك");
      } else if (statusRequest == StatusRequest.serverfailure) {
        return Get.snackbar(
          "تحذير",
          "حدث خطأ غير متوقع",
          backgroundColor: AppColor.red.withOpacity(0.7),
          colorText: AppColor.white,
        );
      }
    } catch (e) {
      print("Error in getTrips: $e");
      return false;
    }
  }

  // ignore: non_constant_identifier_names
  SearchTrips(String date) async {
    try {
      statusRequest = StatusRequest.loading;
      update();

      var response = await addNewEmployeeData.getTrips('$ReservationDate');
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");

      statusRequest = handlingData(response);
      update();

      if (statusRequest == StatusRequest.success) {
        Map mapData = Map.from(response); // Use Map.from to create a copy

        if (mapData["status"] == true) {
          trips = mapData['data']['Trips'];
          trips = trips.toList().reversed.toList();

          if (trips.isNotEmpty) {
            var firstTrip =
                trips[myServices.sharedPreferences.getInt("trip_id")!];

            if (firstTrip['NumChairs'] is Map) {
              chairs = [];

              // Check if the NumChairs contains the requested date
              if (firstTrip['NumChairs'].containsKey(date)) {
                // Get the chair list for the requested date
                var chairList = firstTrip['NumChairs'][date];

                if (chairList != null) {
                  chairs.addAll(chairList
                      .cast<int>()); // Ensure chairList contains integers
                  update();
                }
              }
            } else {
              chairs = [];
            }
            return true;
          } else {
            return Get.snackbar(
              "فشل",
              'لا يوجد رحلات',
              colorText: AppColor.white,
              backgroundColor: AppColor.red.withOpacity(0.7),
              duration: const Duration(seconds: 3),
            );
          }
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
    } catch (e) {
      print("Error in getTrips: $e");
      return false;
    }
  }

  @override
  void onInit() {
    getTrips();
    trip_id;
    trip_id.value = Get.arguments ?? 0;
    print(trip_id.value);
    num_chairs = TextEditingController();
    name = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    getTrips();
    trip_id;
    num_chairs.dispose();
    name.dispose();
    phone.dispose();
    idNumber.dispose();
    super.dispose();
  }
}
