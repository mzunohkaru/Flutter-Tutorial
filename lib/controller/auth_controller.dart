import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final rxAuthUser = Rx<User?>(null);

  // void onInit() {
  //   super.onInit();
  //   FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //     rxAuthUser.value = user;
  //   });
  // }
}
