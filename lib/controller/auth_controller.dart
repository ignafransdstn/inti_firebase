import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:inti_firebase/controller/routes_name.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  // final bool _failed = false;
  // final bool _isVisible = false;
  // final bool _loading = false;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(Routes.home_screen);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
        Get.defaultDialog(
          title: "THE USER NOT FOUND",
          middleText: "Please try another user name",
          onConfirm: () {
            Get.back();
          },
          textConfirm: "OK"
        );
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
        Get.defaultDialog(
          title: "THE PASSWORD WRONG",
          middleText: "Please try another password",
          onConfirm: () {
            Get.back();
          },
          textConfirm: "OK"
        );
      }
    }
  }

  void logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.login_screen);
  }
}
