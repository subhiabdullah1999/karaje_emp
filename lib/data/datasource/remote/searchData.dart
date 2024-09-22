import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);
  searchData(String mobileOrId) async {
    print(AppLink.token);
    var response = await crud.postData(AppLink.searchOnIdOrMobile, {
      "client_MobileOrId": mobileOrId.toString(),
    }, {
      'Authorization': 'Bearer ${AppLink.token}'
    });
    return response.fold((l) => l, (r) => r);
  }

  canceledReservationData(String id) async {
    print(AppLink.token);
    var response = await crud.postData(AppLink.canceledReservation, {
      "reservation_id": id.toString(),
    }, {
      'Authorization': 'Bearer ${AppLink.token}'
    });
    return response.fold((l) => l, (r) => r);
  }
}
