import 'package:fir_sample/core/firestore/doc_ref_core.dart';
import 'package:fir_sample/enums/env_key.dart';
import 'package:fir_sample/models/public_user/public_user.dart';
import 'package:fir_sample/repository/firestore_repository.dart';
import 'package:fir_sample/ui_core/ui_helper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../models/moderated_image/moderated_image.dart';
import '../typedefs/firestore_typedef.dart';
import 'auth_controller.dart';

class MainController extends GetxController {
  static MainController get to => Get.find<MainController>();
  final rxPublicUser = Rx<PublicUser?>(null);

  @override
  void onInit() async {
    await _manageUserInfo();
    super.onInit();
  }

  Future<void> _manageUserInfo() async {
    final authUser = AuthController.to.rxAuthUser.value;
    if (authUser == null) return;
    final repository = FirestoreRepository();
    final uid = authUser.uid;
    final ref = DocRefCore.publicUserDocRef(uid);
    final result = await repository.getDoc(ref);
    result.when(success: (res) async {
      final json = res.data();
      if (res.exists && json != null) {
        rxPublicUser.value = PublicUser.fromJson(json);
      } else {
        await _createPublicUser(ref, uid);
      }
    }, failure: () {
      UIHelper.showFlutterToast("ユーザーの読み取りが失敗しました");
    });
  }

  Future<void> _createPublicUser(DocRef ref, String uid) async {
    final repository = FirestoreRepository();
    final bucketName = dotenv.get(EnvKey.AWS_S3_USER_IMAGES_BUCKET.name);
    final image = ModeratedImage(bucketName: bucketName).toJson();
    final newPublicUser = PublicUser(image: image, uid: uid);
    final json = newPublicUser.toJson();
    final result = await repository.createDoc(ref, json);
    result.when(success: (_) {
      rxPublicUser.value = newPublicUser;
      UIHelper.showFlutterToast("ユーザーの作成が成功しました");
    }, failure: () {
      UIHelper.showFlutterToast("ユーザーの作成が失敗しました");
    });
  }
}
