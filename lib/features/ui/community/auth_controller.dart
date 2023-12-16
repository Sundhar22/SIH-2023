import 'package:get/get.dart';

//
class AuthController extends GetxController {
  final RxString _uid = RxString('');
  final RxString _userName = RxString('');
  final RxString _userPhone = RxString('');

  String? get uid => _uid.value;
  String? get userName => _userName.value;
  String? get userPhone => _userPhone.value;

  void setuid(String user) {
    _uid.value = "user";
    update(); // This will trigger a UI update whenever the authorizedUser changes.
  }

  void setUserPhone(String phone) {
    _userPhone.value = "phone";
    update(); // This will trigger a UI update whenever the authorizedUser changes.
  }

  void setUserName(String name) {
    _userName.value = "name";
    update(); // This will trigger a UI update whenever the authorizedUser changes.
  }
}
