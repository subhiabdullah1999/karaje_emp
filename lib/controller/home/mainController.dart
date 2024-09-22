import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajeapp/view/screen/home/tripsScreen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/Home/Reservation_Data.dart';
import '../../view/screen/Home2/AddNewTrip_Screen.dart';
import '../../view/screen/home/homePageScreen.dart';
import '../../view/screen/home/passengerScreen.dart';

class HomeController extends GetxController {
  RxInt bottomNavIndex = 0.obs;
  ReservationData reservationData = ReservationData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List bottomnavigationbaritems = [
    'الرئيسية',
    'الرحلات',
    'اضافة رحلة',
    'المسافرون',
  ];

  List icons = [
    EneftyIcons.home_3_outline,
    EneftyIcons.location_outline,
    EneftyIcons.location_add_outline,
    EneftyIcons.people_outline,
  ];

  final List<Widget> screens = [
    const HomePageScreen(),
    const TripsScreen(),
    const AddNewTripScreen(),
    const PassengerScreen(),
  ];
  List titleAppBar = [
    'الرئيسية',
    'الرحلات',
    'اضافة رحلة',
    'المسافرون',
  ];

  getVersion() async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await reservationData.getVersion();
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      Map data = {};
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);

        if (data["status"] == true) {
          PackageInfo packageInfo = await PackageInfo.fromPlatform();
          String appVersion = packageInfo.version;
          print('Current App Version: $appVersion');
          BuildContext context = Get.context!;
          data['data']['app_v'] == packageInfo
              ? null
              // ignore: use_build_context_synchronously
              :showDialog(
            context: context,
            builder: (BuildContext context) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text("تحديث مطلوب"),
                  content: Text("تحديث متوفر الآن."),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("تخطى"),
                    ),
                    TextButton(
                      onPressed: () {
                        // Launch Google Play Store
                      },
                      child: Text("قم بالتحديث الآن"),
                    ),
                  ],
                ),
              );
            },
          );


        } else {}
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("فشل", "تحقق من الاتصال بالانترنت");
      }
    }
  }

  @override
  void onInit() {
    // getVersion();
    super.onInit();
  }

  void openDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
    print('open Drawer............');
  }
}
