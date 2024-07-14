import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../controller/my_home_page_controller.dart';
import '../flavors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyHomePageController());
    final authController = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: Obx(() {
        const style = TextStyle(fontSize: 60);
        if (authController.rxAuthUser.value != null) {
          return const Text('ログイン中', style: style);
        } else {
          return const Text('ログアウト中', style: style);
        }
      }),
    );
  }
}
