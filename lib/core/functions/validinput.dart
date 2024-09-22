import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "name") {
    if (!GetUtils.isUsername(val)) {
      return "غير صالح";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "غير صالح";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "رقم الموبايل غير صالح";
    }
  }

  if (val.isEmpty) {
    return "لا يمكن أن يكون فارغ";
  }

  if (val.length < min) {
    return "لا يمكن أن يكون أقل من  $min";
  }

  if (val.length > max) {
    return "لا يمكن أن يكون أكثر من  $max";
  }
}
