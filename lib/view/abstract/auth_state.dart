import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';

abstract class AuthState<T extends StatefulWidget> extends State<T> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            titleWidget(),
            _signupForm(),
            _positiveButton(),
            toggleLoginModeButton()
          ],
        ),
      ),
    );
  }

  // タイトル関数
  Widget titleWidget();

  // 入力フォーム関数
  Widget _signupForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _emailTextField(),
            _passwordTextField(),
          ],
        ));
  }

  // email入力をする関数
  Widget _emailTextField() {
    final controller = AuthController.to;
    return TextFormField(
      decoration: const InputDecoration(hintText: "メールアドレス"),
      onSaved: controller.setEmail,
      validator: (value) {
        return GetUtils.isEmail(value!) ? null : "正しいメールアドレスを入力して下さい";
      },
    );
  }

  // password入力をする関数
  Widget _passwordTextField() {
    final controller = AuthController.to;
    return TextFormField(
      obscureText: true, // パスワードを隠す
      decoration: const InputDecoration(hintText: "パスワード"),
      onSaved: controller.setPassword,
      validator: (value) {
        return value!.length > 7 ? null : "パスワードが短すぎます";
      },
    );
  }

  Widget toggleLoginModeButton();

  Widget _positiveButton() {
    return ElevatedButton(
        onPressed: () {
          // バリデーションを行う
          if (_formKey.currentState!.validate()) {
            // フォームフィールドの情報を変数に保存
            _formKey.currentState!.save();
            AuthController.to.onPositiveButtonPressed();
          }
        },
        child: const Text("送信"));
  }
}