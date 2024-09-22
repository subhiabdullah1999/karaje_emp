import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajeapp/view/screen/Auth/SignIn_Screen.dart';
import 'package:karajeapp/view/screen/home/mainscreen.dart';
import 'package:sizer/sizer.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import '../../data/datasource/remote/Auth/SignIn_data.dart';
import '../../linkapi.dart';
import '../../view/widget/Auth/Auth_Button(WithoutCheckBox).dart';

abstract class SignInController extends GetxController {
  signIn();
}

class SignInControllerImp extends SignInController {
  SignInData loginData = SignInData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController phone;
  late TextEditingController password;
  GlobalKey<FormState> form = GlobalKey<FormState>();

  var isChecked = false.obs;
  var isPasswordVisible = false.obs;
  var isClick = false.obs;

  void updateisClick(bool value) {
    isClick.value = value;
    update();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
    update();
  }

  void toggleChecked() {
    isChecked.toggle();
    update();
  }

  @override
  signIn() async {
    if (form.currentState!.validate()) {
      updateisClick(true);
      //statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.signIn(phone.text, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == true) {
          print(response['data']['Employee']['company']);
          myServices.sharedPreferences
              .setString("token", '${response['data']['token']}');
          myServices.sharedPreferences
              .setString("user_id", '${response['data']['Employee']['id']}');
          myServices.sharedPreferences.setString(
              "logo", '${response['data']['Employee']['company']['logo']}');
          myServices.sharedPreferences.setString("companyName",
              '${response['data']['Employee']['company']['Companyname']}');
          //======
          AppLink.logo = '${response['data']['Employee']['company']['logo']}';
          AppLink.token = '${response['data']['token']}';
          AppLink.companyName =
              '${response['data']['Employee']['company']['Companyname']}';

          Get.offAll(const MainScreen());
        }
      } else {
        updateisClick(false);
        update();
        BuildContext context = Get.context!;
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              children: [
                Text(
                  "رقم الموبايل أو كلمة المرور خاطئة أعد المحاولة \n لاحقا",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Cairo",
                    decoration: TextDecoration.none,
                  ),
                ),
                Transform.scale(
                  scaleY: 0.8,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15.w, 2.h, 15.w, 1.h),
                    child: AuthButtonWithoutCheckBox(
                      buttonText: 'حسنا',
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ).show();
      }
      updateisClick(false);
      update();
    } else {
      updateisClick(false);
      update();
    }
  }

  @override
  void onInit() {
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
