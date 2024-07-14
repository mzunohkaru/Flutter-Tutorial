import 'package:firebase_auth/firebase_auth.dart';

class AuthClient {
  Future<UserCredential> createUserWithEmailAndPassword(
          String email, String password) async =>
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

  Future<UserCredential> signInWithEmailAndPassword(
          String email, String password) async =>
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

  Future<void> signOut() async => await FirebaseAuth.instance.signOut();

  Future<void> sendEmailVerification(User user) async {
    await user.sendEmailVerification();
  }
}
