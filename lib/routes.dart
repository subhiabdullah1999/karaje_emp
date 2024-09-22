import 'package:get/get.dart';
import 'package:karajeapp/view/screen/Auth/SignIn_Screen.dart';
import 'package:karajeapp/view/screen/Home2/AddNewReservation_Screen.dart';
import 'package:karajeapp/view/screen/Home2/AddNewTrip_Screen.dart';
import 'package:karajeapp/view/screen/Home2/CheckParCode_Screen.dart';

import 'core/constant/routes.dart';

List<GetPage<dynamic>>? routes = [
  // Auth
  GetPage(name: AppRoute.signIn, page: () => const SignInScreen()),

  // Home
  GetPage(name: AppRoute.checkBarCode, page: () => const CheckBarCodeScreen()),
  GetPage(
      name: AppRoute.addNewReservation,
      page: () => const AddNewReservationScreen()),
  GetPage(name: AppRoute.addNewTrip, page: () => const AddNewTripScreen()),
];
