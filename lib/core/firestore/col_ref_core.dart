import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constant/my_home_page_constant.dart';
import '../../typedefs/firestore_typedef.dart';

class ColRefCore {
  static ColRef publicUsersColRef() =>
      FirebaseFirestore.instance.collection(MyHomePageConstant.collectionPath);
}
