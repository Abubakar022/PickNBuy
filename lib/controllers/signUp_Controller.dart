import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_app/models/user-model.dart';
import 'package:e_app/utils/app-colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'deviceToken-Controller.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Password Visibility
  var isPasswordVisible = false.obs;

  Future<UserCredential?> SignUpWithEmailFun(
    String UserEmail,
    String UserName,
    String UserPhone,
    String UserCity,
    String UserPassword,
    String UserDeviceToken,
  ) async {

    try {
      EasyLoading.show(status: "Please Wait...");
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: UserEmail, password: UserPassword);
      // Send Email Verification
      await userCredential.user!.sendEmailVerification();
      UserModel userModel = UserModel(
          uId: userCredential.user!.uid,
          username: UserName,
          email: UserEmail,
          phone: UserPhone,
          userImg: '',
          userDeviceToken:UserDeviceToken ,
          country: '',
          userAddress: '',
          street: '',
          isAdmin: false,
          isActive: true,
          createdOn: DateTime.now(),
          city: UserCity);
      //Add data in Firebase
      _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());
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
