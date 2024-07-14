import 'package:fir_sample/repository/auth_repository.dart';
import 'package:fir_sample/ui_core/ui_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();
  final rxAuthUser = Rx<User?>(FirebaseAuth.instance.currentUser);
  final rxIsLoginMode = true.obs;
  String email = '';
  String password = '';

  void setEmail(String? value) {
    if (value != null) {
      email = value;
    }
  }

  void setPassword(String? value) {
    if (value != null) {
      password = value;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    // 認証状態が変化するたびに、リスナーが呼び出される
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      rxAuthUser.value = user;
    });
  }

  void onPositiveButtonPressed() async {
    if (GetUtils.isEmail(email) && password.length >= 8) {
      rxIsLoginMode.value
          ? await _signInWithEmailAndPassword()
          : await _createUserWithEmailAndPassword();
    }
  }

  Future<void> _createUserWithEmailAndPassword() async {
    final repository = AuthRepository();
    final result = await repository.createUserWithEmailAndPassword(
        email.trim(), password.trim());
    result.when(
      success: (res) {
        rxAuthUser.value = res;
        UIHelper.showFlutterToast("新規登録が成功しました");
      },
      failure: () {
        UIHelper.showFlutterToast("新規登録に失敗しました");
      },
    );
  }

  Future<void> _signInWithEmailAndPassword() async {
    final repository = AuthRepository();
    final result = await repository.signInWithEmailAndPassword(
        email.trim(), password.trim());
    result.when(
      success: (res) {
        rxAuthUser.value = res;
        UIHelper.showFlutterToast("ログインが成功しました");
      },
      failure: () {
        UIHelper.showFlutterToast("ログインに失敗しました");
      },
    );
  }

  void onSignOutButtonPressed() async {
    await _signOut();
  }

  Future<void> _signOut() async {
    final repository = AuthRepository();
    final result = await repository.signOut();
    result.when(
      success: (res) {
        rxAuthUser.value = null;
        UIHelper.showFlutterToast("ログアウトが成功しました");
      },
      failure: () {
        UIHelper.showFlutterToast("ログアウトに失敗しました");
      },
    );
  }

  Future<void> _sendEmailVerification() async {
    final repository = AuthRepository();
    final result = await repository.sendEmailVerification(rxAuthUser.value!);
  }

  void onToggleLoginModeButtonPressed() => _toggleIsLoginMode();
  void _toggleIsLoginMode() => rxIsLoginMode.value = !rxIsLoginMode.value;
}
