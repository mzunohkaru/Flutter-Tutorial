import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/my_home_page_controller.dart';
import '../../../flavors.dart';
import 'components/auth_screen/auth_screen.dart';
import 'components/verify_email_screen.dart';

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
        const style = TextStyle(fontSize: 30.0);
        final authUser = authController.rxAuthUser.value;
        if (authUser == null) {
          return const AuthScreen();
        } else if (!authUser.emailVerified) {
          return const VerifyEmailScreen();
        } else {
          return ElevatedButton(
              onPressed: authController.onSignOutButtonPressed,
              child: const Text(
                "ログアウトする",
                style: style,
              ));
        }
      }),
    );
  }
}
