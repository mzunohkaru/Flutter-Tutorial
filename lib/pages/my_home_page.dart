import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/my_home_page_controller.dart';
import '../flavors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyHomePageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: controller.onFloatingActionButtonPressed),
      body: Center(
        child: Obx(
          () => Text(
            'ユーザーID: ${controller.rxDoc.value?.id ?? "---"}',
            style: const TextStyle(fontSize: 40.0),
          ),
        ),
      ),
    );
  }
}
