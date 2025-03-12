import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../utils/app-colors.dart';

class DeviceTokenController extends GetxController {
  String? deviceToken;

  void onInit() {
    super.onInit();
    getDeviceToken();
  }

  Future<void> getDeviceToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        deviceToken = token;
        update();
      }
    } catch (e) {
      Get.snackbar("Error", '$e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.primary,
          colorText: Color(0xFFf3f6f8));
    }
  }
}
