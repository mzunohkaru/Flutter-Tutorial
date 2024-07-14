import 'package:fir_sample/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late double? _deviceHeight;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _deviceHeight = size.height;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [_titleWidget(), _signupForm(), _positiveButton()],
      ),
    );
  }

  // タイトル関数
  Widget _titleWidget() {
    return const Text(
      "新規登録",
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }

  // 入力フォーム関数
  Widget _signupForm() {
    return SizedBox(
      height: _deviceHeight! * 0.30,
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              _emailTextField(),
              _passwordTextField(),
            ],
          )),
    );
  }

  // email入力をする関数
  Widget _emailTextField() {
    final controller = AuthController.to;
    return TextFormField(
      decoration: const InputDecoration(hintText: "メールアドレス"),
      // onSaved: (value) => controller.setEmail(value),
      validator: (value) {
        return GetUtils.isEmail(value!) ? null : "正しいメールアドレスを入力して下さい";
      },
      onSaved: controller.setEmail,
    );
  }

  // password入力をする関数
  Widget _passwordTextField() {
    final controller = AuthController.to;
    return TextFormField(
      obscureText: true, // パスワードを隠す
      decoration: const InputDecoration(hintText: "パスワード"),
      // onSaved: (value) => controller.setPassword(value),
      validator: (value) {
        return value!.length > 7 ? null : "パスワードは8文字以上で入力して下さい";
      },
      onSaved: controller.setPassword,
    );
  }

  Widget _positiveButton() {
    return ElevatedButton(
        onPressed: () {
          // バリデーションを行う
          if (_formKey.currentState!.validate()) {
            // フォームフィールドの情報を変数に保存
            _formKey.currentState!.save();
          }
        },
        child: const Text("送信"));
  }
}
