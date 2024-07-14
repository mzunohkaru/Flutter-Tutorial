import 'package:fir_sample/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final mainController = Get.put(MainController());
    final authController = AuthController.to;
    const style = TextStyle(fontSize: 30.0);
    return Column(
      children: [
        Obx(
          () => Text(
            mainController.rxPublicUser.value?.uid ?? "Nullです",
            style: style,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
            onPressed: authController.onSignOutButtonPressed,
            child: const Text(
              "ログアウトする",
              style: style,
            )),
      ],
    );
  }
}
