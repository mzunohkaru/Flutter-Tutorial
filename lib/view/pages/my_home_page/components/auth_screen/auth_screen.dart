import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/auth_controller.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Obx(() {
      if (controller.rxIsLoginMode.value) {
        return InkWell(
          onTap: controller.onToggleLoginModeButtonPressed,
          child: const Text('Login Screen'),
        );
      } else {
        return InkWell(
          onTap: controller.onToggleLoginModeButtonPressed,
          child: const Text('Signup Screen'),
        );
      }
    });
  }
}
