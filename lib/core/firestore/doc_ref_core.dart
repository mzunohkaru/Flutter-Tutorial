import 'package:fir_sample/core/firestore/col_ref_core.dart';

import '../../typedefs/firestore_typedef.dart';

class DocRefCore {
  static DocRef publicUserDocRef(String uid) =>
      ColRefCore.publicUsersColRef().doc(uid);
}
