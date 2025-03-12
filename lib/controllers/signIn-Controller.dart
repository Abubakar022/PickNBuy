import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_app/models/user-model.dart';
import 'package:e_app/utils/app-colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Password Visibility
  var isPasswordVisible = false.obs;

  Future<UserCredential?> SignInWithEmailFun(
    String UserEmail,
    String UserPassword,
  ) async {
    try {
      EasyLoading.show(status: "Please Wait...");
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: UserEmail, password: UserPassword);

      EasyLoading.dismiss();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", '$e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.primary,
          colorText: Color(0xFFf3f6f8));
    }
  }
}
