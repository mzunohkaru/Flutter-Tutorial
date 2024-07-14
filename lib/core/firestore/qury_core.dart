import 'package:fir_sample/core/firestore/col_ref_core.dart';

import '../../typedefs/firestore_typedef.dart';

class QueryCore {
  static MapQuery publicUsersOrderByFollowerCount() =>
      ColRefCore.publicUsersColRef().orderBy('followerCount', descending: true);
}
