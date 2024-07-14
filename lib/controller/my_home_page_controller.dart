import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fir_sample/constant/my_home_page_constant.dart';
import 'package:fir_sample/repository/firestore_repository.dart';
import 'package:fir_sample/ui_core/ui_helper.dart';
import 'package:get/get.dart';

import '../models/public_user/public_user.dart';
import '../typedefs/firestore_typedef.dart';

class MyHomePageController extends GetxController {
  final rxDoc = Rx<Doc?>(null);

  void onFloatingActionButtonPressed() async {
    await _createDoc();
  }

  Future<void> _createDoc() async {
    final repository = FirestoreRepository();
    const user = PublicUser(uid: "fromRepository");
    final ref = FirebaseFirestore.instance
        .collection(MyHomePageConstant.collectionPath)
        .doc(user.uid);
    final data = user.toJson();
    final result = await repository.createDoc(ref, data);
    result.when(success: (_) async {
      await _readDoc(ref);
    }, failure: () {
      UIHelper.showFlutterToast(MyHomePageConstant.createUserFailureMessage);
    });
  }

  Future<void> _readDoc(DocRef ref) async {
    final repository = FirestoreRepository();
    final result = await repository.getDoc(ref);
    result.when(success: (doc) {
      rxDoc.value = doc;
      UIHelper.showFlutterToast(MyHomePageConstant.successMessage);
    }, failure: () {
      UIHelper.showFlutterToast(MyHomePageConstant.readUserFailureMessage);
    });
  }
}
