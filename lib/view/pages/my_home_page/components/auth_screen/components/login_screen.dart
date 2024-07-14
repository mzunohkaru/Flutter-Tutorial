import 'package:flutter/material.dart';

import '../../../../../../controller/auth_controller.dart';
import '../../../../../abstract/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends AuthState<LoginScreen> {
  @override
  Widget titleWidget() {
    return const Text(
      "ログイン",
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget toggleLoginModeButton() {
    return TextButton(
        onPressed: AuthController.to.onToggleLoginModeButtonPressed,
        child: const Text("新規登録画面へ"));
  }
}
