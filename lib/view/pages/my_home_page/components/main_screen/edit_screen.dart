import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constant/edit_constant.dart';
import '../../../../../controller/edit_controller.dart';
import '../../../../common/rounded_button.dart';
import '../../../../common/text_filed_container.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(EditController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_titleWidget(), _form(), _positiveButton()],
    );
  }

  // タイトル関数
  Widget _titleWidget() {
    return const Text(
      EditConstant.title,
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }

  // 入力フォーム関数
  Widget _form() {
    return Form(key: _formKey, child: _nameTextField());
  }

  // name入力をする関数
  Widget _nameTextField() {
    return TextFieldContainer(
        child: TextFormField(
      decoration: const InputDecoration(hintText: EditConstant.hintText),
      onSaved: EditController.to.setName,
      validator: (value) {
        return value!.isEmpty ? EditConstant.validatorMsg : null;
      },
    ));
  }

  // 送信するボタン
  Widget _positiveButton() {
    return RoundedButton(
        color: Colors.green,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
          }
          EditController.to.onPositiveButtonPressed();
        },
        textValue: EditConstant.positiveButtonText);
  }
}
