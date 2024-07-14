import 'package:fir_sample/infrastructure/firestore/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../infrastructure/auth/auth_client.dart';
import '../models/result/result.dart';

class AuthRepository {
  FutureResult<User> createUserWithEmailAndPassword(
      String email, String password) async {
    final client = AuthClient();
    try {
      final res = await client.createUserWithEmailAndPassword(email, password);
      final user = res.user;
      return user == null ? const Result.failure() : Result.success(user);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<User> signInWithEmailAndPassword(
      String email, String password) async {
    final client = AuthClient();
    try {
      final res = await client.signInWithEmailAndPassword(email, password);
      final user = res.user;
      return user == null ? const Result.failure() : Result.success(user);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> signOut() async {
    final client = AuthClient();
    try {
      await client.signOut();
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<bool> sendEmailVerification(User user) async {
    final client = AuthClient();
    try {
      await client.sendEmailVerification(user);
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }
}
