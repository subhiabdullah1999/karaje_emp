import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Auth/SignIn_Controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/Auth/Auth_Button.dart';
import '../../widget/Auth/Custom_TextField.dart';
import '../../widget/Auth/Privacy_Checkbox.dart';
import '../../widget/Auth/SignIn_Title.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignInControllerImp());
    return Scaffold(
      body: GetBuilder<SignInControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.form,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SignInTitle(),
                  CustomTextField(
                    valid: (val) {
                      return validInput(val!, 10, 10, "phone");
                    },
                    controller: controller.phone,
                    keyboardType: TextInputType.phone,
                    labelText: 'رقم الهاتف',
                    hintText: ' رقم الهاتف 09xxxxxxxx',
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomTextField(
                    valid: (val) {
                      return validInput(val!, 8, 25, "password");
                    },
                    controller: controller.password,
                    keyboardType: TextInputType.visiblePassword,
                    labelText: 'كلمة المرور',
                    hintText: '***********************',
                    isPassword: true,
                  ),
                  PrivacyCheckbox(),
                  AuthButton(
                    buttonText: 'تسجيل الدخول',
                    onPressed: () async {
                      controller.signIn();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
