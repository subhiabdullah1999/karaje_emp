import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class TripsData {
  Crud crud;
  TripsData(this.crud);
  searchData(String idStart, String idEnd, String date) async {
    var response = await crud.postData(
        AppLink.searchForCompany,
        {"start_id": idStart, "end_id": idEnd, "date": date},
        {'Authorization': 'Bearer ${AppLink.token}'});
    return response.fold((l) => l, (r) => r);
  }

  searchForTodayData() async {
    var response = await crud.getData(AppLink.getTripForEmployeeToday,
        {'Authorization': 'Bearer ${AppLink.token}'});
    return response.fold((l) => l, (r) => r);
  }

  searchForDayData(String date) async {
    var response = await crud.postData(AppLink.getTripForEmployeeBydayy,
        {'date': date}, {'Authorization': 'Bearer ${AppLink.token}'});
    return response.fold((l) => l, (r) => r);
  }

  canceledTrip(String idTrip) async {
    var response = await crud.postData(AppLink.canceledTrip, {"id": idTrip},
        {'Authorization': 'Bearer ${AppLink.token}'});
    return response.fold((l) => l, (r) => r);
  }

  getcities() async {
    var response = await crud
        .getData(AppLink.getcity, {'Authorization': 'Bearer ${AppLink.token}'});
    return response.fold((l) => l, (r) => r);
  }
}
