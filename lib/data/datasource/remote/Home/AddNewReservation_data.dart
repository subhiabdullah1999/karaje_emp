import 'package:get/get.dart';

import '../../../../core/class/crud.dart';
import '../../../../core/services/services.dart';
import '../../../../linkapi.dart';

class AddNewReservationData {
  Crud crud;

  AddNewReservationData(this.crud);

  MyServices myServices = Get.find();

  postdata(String trip_id, List<String> numChairs, String name, mobile,
      String date, idNumber) async {
    Map<String, dynamic> data = {
      "trip_id": trip_id,
      "name": name,
      'idNumber': idNumber.toString(),
      'mobile': mobile.toString(),
      'date': date,
    };

    for (int i = 0; i < numChairs.length; i++) {
      data["num_chairs[$i]"] = numChairs[i];
    }

    var response = await crud.postData(AppLink.addreservation, data, {});

    return response.fold((l) => l, (r) => r);
  }

  completedResData(
    String idTrip,
  ) async {
    Map data = {};

    data['reservation_id'] = idTrip.toString();

    print(data);

    var response = await crud.postData(AppLink.completedRes, data, {});
    return response.fold((l) => l, (r) => r);
  }

  paymentResData(
    String idTrip,
  ) async {
    var response = await crud.getData('${AppLink.Payment}/$idTrip', {});
    return response.fold((l) => l, (r) => r);
  }

  getTrips(String date) async {
    print("trrrrrrrrrrreyyyyyyyyyyyyyyyyyyyywuuuuuuuuuuuuuuuuuu");
    print(date.toString().split(' ')[0]);
    print("trrrrrrrrrrreyyyyyyyyyyyyyyyyyyyywuuuuuuuuuuuuuuuuuu");

    Map<String, dynamic> data = {
      "date": date.toString().split(' ')[0],
    };
    var response = await crud.postData(AppLink.gettrips, data, {
      'Authorization':
          'Bearer ${myServices.sharedPreferences.getString("token")}'
    });
    return response.fold((l) => l, (r) => r);
  }

  addnotification(
    String type,
    String description,
    String client_id,
  ) async {
    Map<String, dynamic> data = {
      "type": type,
      "description": description,
      'client_id': client_id,
    };

    var response = await crud.postData(AppLink.addnotification, data, {});

    return response.fold((l) => l, (r) => r);
  }

  sendMessageFivicationResData(
    String numberPhone,
    String numCard,
    String fromCity,
    String toCity,
    String dateTimeTrav,
    String hourTrav,
  ) async {
    print(
        "t3333333333333333333333333333333333333333333333333333333344444444444444");
    print(hourTrav);
    print(numberPhone);

    print(
        "t3333333333333333333333333333333333333333333333333333333344444444444444");

    var response = await crud.postData(
        "https://bms.syriatel.sy/API/SendTemplateSMS.aspx?user_name=Karajy1&password=Pp@123456&template_code=Karajy1_t3&param_list=$numCard;$fromCity;$toCity;$dateTimeTrav;$hourTrav&sender=Karajy&to=$numberPhone",
        {},
        {});

    return response.fold((l) => l, (r) => r);
  }
}
