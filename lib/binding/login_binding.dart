import 'package:get/get.dart';
import 'package:inti_firebase/controller/auth_controller.dart';

class LoginBinding implements Bindings {
  late String email;
  late String password;

  @override
  void dependencies() {
    Get.put(AuthController().login(email, password));
  }
}