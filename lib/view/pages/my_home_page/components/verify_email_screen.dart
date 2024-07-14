import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/verify_email_controller.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(VerifyEmailController());
    const style = TextStyle(fontSize: 40.0);
    return const Center(
      child: Text(
        "メールアドレスを認証する",
        style: style,
      ),
    );
  }
}
