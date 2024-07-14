import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/auth_controller.dart';
import 'components/login_screen.dart';
import 'components/signup_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Obx(() {
      if (controller.rxIsLoginMode.value) {
        return const LoginScreen();
      } else {
        return const SignupScreen();
      }
    });
  }
}
