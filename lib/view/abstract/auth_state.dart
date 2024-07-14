import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/auth_constant.dart';
import '../../controller/auth_controller.dart';
import '../common/rounded_button.dart';
import '../common/text_filed_container.dart';

abstract class AuthState<T extends StatefulWidget> extends State<T> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          titleWidget(),
          _signupForm(),
          _positiveButton(),
          toggleLoginModeButton()
        ],
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
    return TextFieldContainer(
      child: TextFormField(
        decoration: const InputDecoration(hintText: AuthConstant.emailHintText),
        onSaved: controller.setEmail,
        validator: (value) {
          return GetUtils.isEmail(value!)
              ? null
              : AuthConstant.emailValidatorMsg;
        },
      ),
    );
  }

  // password入力をする関数
  Widget _passwordTextField() {
    final controller = AuthController.to;
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true, // パスワードを隠す
        decoration:
            const InputDecoration(hintText: AuthConstant.passwordHintText),
        onSaved: controller.setPassword,
        validator: (value) {
          return value!.length > 7 ? null : AuthConstant.passwordValidtorMsg;
        },
      ),
    );
  }

  Widget toggleLoginModeButton();

  Widget _positiveButton() {
    return RoundedButton(
        onPressed: () {
          // バリデーションを行う
          if (_formKey.currentState!.validate()) {
            // フォームフィールドの情報を変数に保存
            _formKey.currentState!.save();
          }
          AuthController.to.onPositiveButtonPressed();
        },
        textValue: AuthConstant.positiveButtonText);
  }
}
