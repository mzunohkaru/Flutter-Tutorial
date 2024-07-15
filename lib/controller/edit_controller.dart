import 'package:fir_sample/controller/main_controller.dart';
import 'package:fir_sample/core/firestore/doc_ref_core.dart';
import 'package:fir_sample/ui_core/ui_helper.dart';
import 'package:get/get.dart';

import '../constant/edit_constant.dart';
import '../repository/firestore_repository.dart';
import 'auth_controller.dart';

class EditController extends GetxController {
  static EditController get to => Get.find<EditController>();
  String name = "";
  void setName(String? value) {
    if (value == null) return;
    name = value;
  }

  void onPositiveButtonPressed() async {
    if (name.isEmpty) return;
    await _updatePublicUser();
  }

  Future<void> _updatePublicUser() async {
    final repository = FirestoreRepository();
    final uid = AuthController.to.rxAuthUser.value!.uid;
    final ref = DocRefCore.publicUserDocRef(uid);
    final data = {
      "name": name,
    };
    final result = await repository.updateDoc(ref, data);
    result.when(success: (_) {
      final oldPublicUser = MainController.to.rxPublicUser.value;
      if (oldPublicUser == null) return;
      final newPublicUser = oldPublicUser.copyWith(
        name: name,
      ); // 一部分のみ更新
      MainController.to.rxPublicUser.value = newPublicUser; // 新しく更新
      UIHelper.showFlutterToast(EditConstant.successMsg);
    }, failure: () {
      UIHelper.showFlutterToast(EditConstant.failureMsg);
    });
  }
}
