import 'package:fir_sample/infrastructure/firestore/result.dart';

import '../infrastructure/firestore/firestore_client.dart';
import '../models/result/result.dart';
import '../typedefs/firestore_typedef.dart';

class FirestoreRepository {
  FutureResult<bool> createDoc(DocRef ref, SDMap data) async {
    final client = FirestoreClient();
    try {
      await client.createDoc(ref, data);
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<bool> updateDoc(DocRef ref, SDMap data) async {
    final client = FirestoreClient();
    try {
      await client.updateDoc(ref, data);
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<Doc> getDoc(DocRef ref) async {
    final client = FirestoreClient();
    try {
      final doc = await client.getDoc(ref);
      return Result.success(doc);
    } catch (e) {
      return const Result.failure();
    }
  }
}
