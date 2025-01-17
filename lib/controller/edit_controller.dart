import 'dart:typed_data';

import 'package:fir_sample/controller/main_controller.dart';
import 'package:fir_sample/core/firestore/doc_ref_core.dart';
import 'package:fir_sample/ui_core/ui_helper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../constant/edit_constant.dart';
import '../enums/env_key.dart';
import '../models/moderated_image/moderated_image.dart';
import '../repository/aws_s3_repository.dart';
import '../repository/firestore_repository.dart';
import '../ui_core/file_core.dart';
import 'auth_controller.dart';

class EditController extends GetxController {
  static EditController get to => Get.find<EditController>();
  final rxUint8list = Rx<Uint8List?>(null);
  String name = "";
  void setName(String? value) {
    if (value == null) return;
    name = value;
  }

  void onPositiveButtonPressed() async {
    final uint8list = rxUint8list.value;
    if (name.isEmpty && uint8list == null) return;
    // 画像をアップロードする
    final repository = AWSS3Repository();
    final bucket = dotenv.get(EnvKey.AWS_S3_USER_IMAGES_BUCKET.name);
    const object = "s3-first-image";
    final data = Stream.value(uint8list!);
    final result = await repository.putObject(bucket, object, data);
    result.when(success: (_) async {
      await _updatePublicUser(bucket, object);
    }, failure: () {
      UIHelper.showFlutterToast("画像のアップロードが失敗しました");
    });
  }

  Future<void> _updatePublicUser(String bucketName, String fileName) async {
    final repository = FirestoreRepository();
    final uid = AuthController.to.rxAuthUser.value!.uid;
    final ref = DocRefCore.publicUserDocRef(uid);
    final image =
        ModeratedImage(bucketName: bucketName, fileName: fileName).toJson();
    final data = {
      "name": name,
      "image": image,
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

  void onImageIconTapped() async {
    final result = await FileCore.getImage();
    rxUint8list.value = result;
  }
}
