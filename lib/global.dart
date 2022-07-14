import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:orientation/orientation.dart';
import 'package:uu_app/common/util/index.dart';
import 'common/services/index.dart';
import 'common/store/index.dart';

class Global {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await OrientationPlugin.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    await Future.wait([
      Get.putAsync<StorageService>(() => StorageService().init()),
    ]).whenComplete(() {
      StorageService.to.remove(StorageKey.boardingPass);
      Get.put<ConfigStore>(ConfigStore());
      Get.put<UserStore>(UserStore());
    });
  }
}
