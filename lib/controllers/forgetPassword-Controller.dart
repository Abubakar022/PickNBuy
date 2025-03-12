import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_app/models/user-model.dart';
import 'package:e_app/screens/User-App/signIn-screen.dart';
import 'package:e_app/utils/app-colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class forgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> forgetPasswordControllerFun(
    String UserEmail,
  ) async {
    try {
      EasyLoading.show(status: "Please Wait...");
      await _auth.sendPasswordResetEmail(email: UserEmail);
      Get.snackbar("Email Sent...", 'emails send to your $UserEmail',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.primary,
          colorText: Color(0xFFf3f6f8));
       Get.off(() => SignInScreen());
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error...", '$e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.primary,
          colorText: Color(0xFFf3f6f8));
    }
  }
}
