import 'package:get/get.dart';

class AuthRegisterController extends GetxController {
  String? username;
  String? email;
  String? password;
  String? confirmPassword;
  String? role;
  Rx<bool> isCheckedTnC = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
