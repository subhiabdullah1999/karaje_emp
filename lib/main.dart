import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajeapp/bindings/intialbindings.dart';
import 'package:karajeapp/routes.dart';
import 'package:karajeapp/view/screen/splash/splash.dart';
import 'package:karajeapp/view/widget/shared/noInternet.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'package:sizer/sizer.dart';
// import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return Sizer(builder: (context, orientation, deviceType) {
      return NoInternetWidget(
        widget: GetMaterialApp(
          useInheritedMediaQuery: true,
          translations: MyTranslation(),
          debugShowCheckedModeBanner: false,
          theme: controller.appTheme,
          home:  Splash(),
          locale: const Locale('ar'),
          initialBinding: InitialBindings(),
          getPages: routes,
        ),
      );
    });
  }
}
