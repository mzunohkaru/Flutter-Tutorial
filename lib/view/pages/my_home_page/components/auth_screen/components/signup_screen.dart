import 'package:fir_sample/controller/auth_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../abstract/auth_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends AuthState<SignupScreen> {
  @override
  Widget titleWidget() {
    return const Text(
      "新規登録",
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget toggleLoginModeButton() {
    const style = TextStyle(fontSize: 25.0);
    return TextButton(
        onPressed: AuthController.to.onToggleLoginModeButtonPressed,
        child: const Text(
          "ログイン画面へ",
          style: style,
        ));
  }
}
