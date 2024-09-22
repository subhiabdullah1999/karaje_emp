import 'package:get/get.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/services/services.dart';
import '../../../../linkapi.dart';

class ReservationData {
  Crud crud;

  ReservationData(this.crud);

  MyServices myServices = Get.find();

  getReservation() async {
    var response = await crud.getData(
        '${AppLink.getReservation}/${myServices.sharedPreferences.getString("reservationId")}',
        {'Authorization': 'Bearer ${AppLink.token}'});
    return response.fold((l) => l, (r) => r);
  }

  getVersion() async {
    var response = await crud.getData('${AppLink.getversion}', {});
    return response.fold((l) => l, (r) => r);
  }
}
