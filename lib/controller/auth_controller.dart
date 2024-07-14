import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();
  final rxAuthUser = Rx<User?>(null);
  final rxIsLoginMode = false.obs;
  String email = '';
  String password = '';

  void setEmail(String? value) {
    if (value != null) {
      email = value;
    }
  }

  void setPassword(String? value) {
    if (value != null) {
      password = value;
    }
  }

  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      rxAuthUser.value = user;
    });
  }

  void onToggleLoginModeButtonPressed() => _toggleIsLoginMode();
  void _toggleIsLoginMode() => rxIsLoginMode.value = !rxIsLoginMode.value;
}
