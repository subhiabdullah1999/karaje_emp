import 'package:get/get.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/services/services.dart';
import '../../../../linkapi.dart';

class AddNewTripData {
  Crud crud;

  AddNewTripData(this.crud);
  MyServices myServices = Get.find();

  addTrip(
    String driver_id,
    String user_id,
    String start_id,
    String end_id,
    String price,
    String num_chairs,
    String num_bus,
    String start_date,
    String end_date,
    List<String> date,
    String start_time,
    String end_time,
  ) async {
    Map<String, dynamic> data = {
      "driver_id": driver_id,
      "user_id": user_id,
      "start_id": start_id,
      "end_id": end_id,
      "price": price,
      "num_chairs": num_chairs,
      "num_bus": num_bus,
      "start_date": start_date,
      "end_date": end_date,
      "start_time": start_time,
      "end_time": end_time,
    };

    for (int i = 0; i < 0; i++) {
      data["date[$i]"] = date[i];
    }

    var response = await crud.postData(AppLink.addnewtrip, data, {});
    return response.fold((l) => l, (r) => r);
  }

  getdrivers() async {
    var response = await crud.getData(AppLink.getdrivers, {
      'Authorization':
          'Bearer ${myServices.sharedPreferences.getString("token")}'
    });
    return response.fold((l) => l, (r) => r);
  }

  getcities() async {
    var response = await crud.getData(AppLink.getcities, {});
    return response.fold((l) => l, (r) => r);
  }
}
