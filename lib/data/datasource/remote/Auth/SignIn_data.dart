import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class SignInData {
  Crud crud;

  SignInData(this.crud);

  signIn(
    String mobile,
    String password,
  ) async {
    var response = await crud.postData(AppLink.signIn, {
      "mobile": mobile,
      "password": password,
    }, {});
    return response.fold((l) => l, (r) => r);
  }
}
