import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../utils/app-colors.dart';

class bannerController extends GetxController {
  RxList<String> bannersUrl = RxList<String>([]);

  void onInit() {
    super.onInit();
    bannerImages();
  }

  Future<void> bannerImages() async {
    try {
      QuerySnapshot bannersSnapshot =
          await FirebaseFirestore.instance.collection('banner').get();
      if (bannersSnapshot.docs.isNotEmpty) {
        bannersUrl.value =
            bannersSnapshot.docs.map((doc) => doc['imageUrl'] as String).toList();
      }
    } catch (e) {
      Get.snackbar("Error...", '$e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.primary,
          colorText: Color(0xFFf3f6f8));
    }
  }
}
