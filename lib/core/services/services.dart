import 'package:get/get.dart';
import 'package:karajeapp/linkapi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    //await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
  MyServices myServices = Get.find();
  AppLink.token = myServices.sharedPreferences.getString('token') ??
      '';
  AppLink.logo = myServices.sharedPreferences.getString('logo') ?? '';
  AppLink.companyName =
      myServices.sharedPreferences.getString('companyName') ?? '';
  print(AppLink.token +'---');
}
