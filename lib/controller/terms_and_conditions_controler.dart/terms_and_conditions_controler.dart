import 'package:get/get.dart';

abstract class TermsAndConditionsController extends GetxController {}

class TermsAndConditionsControllerImp extends TermsAndConditionsController {
  int isSelect = 0;
  updateUi() {
    update();
  }
}
