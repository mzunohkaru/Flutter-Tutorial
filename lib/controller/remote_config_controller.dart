import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';

import '../constant/remote_config_constant.dart';

class RemoteConfigController extends GetxController {
  final RxBool rxIsMaintenanceMode = false.obs;

  @override
  void onInit() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    final remoteConfigSettings = RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        // 15秒ごとにリモート設定を取得する
        minimumFetchInterval: const Duration(seconds: 15));
    await remoteConfig.setConfigSettings(remoteConfigSettings);
    const key = RemoteConfigConstant.maintenanceModeKey;
    // デフォルトの値を設定
    await remoteConfig.setDefaults({
      key: false, // maintenance_mode: false,
    });
    // 値を取得
    await remoteConfig.fetchAndActivate();
    rxIsMaintenanceMode.value = remoteConfig.getBool(key);
    super.onInit();
  }
}
