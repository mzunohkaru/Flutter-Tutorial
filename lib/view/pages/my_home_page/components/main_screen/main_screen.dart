import 'package:fir_sample/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'content_screen.dart';
import 'edit_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return Obx(() {
      final publicUser = controller.rxPublicUser.value;
      if (publicUser == null) {
        return const CircularProgressIndicator();
      } else {
        return publicUser.name.isEmpty
            ? const EditScreen()
            : const ContentScreen();
      }
    });
  }
}
