import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/auth_controller.dart';
import '../../../../../controller/main_controller.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final authController = AuthController.to;
    const style = TextStyle(fontSize: 30.0);
    return Column(
      children: [
        Obx(
          () => Text(
            MainController.to.rxPublicUser.value?.name ?? "Nullです",
            style: style,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        // TODO: ByteImage(bytes: bytes),
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
