import 'package:flutter/material.dart';

import '../../../../controller/auth_controller.dart';
 
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final authController = AuthController.to;
    const style = TextStyle(fontSize: 30.0);
    return ElevatedButton(
        onPressed: authController.onSignOutButtonPressed,
        child: const Text(
          "ログアウトする",
          style: style,
        ));
  }
}