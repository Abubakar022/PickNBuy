import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_app/models/user-model.dart';
import 'package:e_app/screens/User-App/main-Screen.dart';
import 'package:e_app/screens/User-App/welcome-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController extends GetxController {
  final _googleSignIn = GoogleSignIn();

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> GoogleSignInFun() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        EasyLoading.show(status: "Please Wait..");
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        final User? user = userCredential.user;
        if (user != null) {
          final UserModel userModel = UserModel(
              uId: user.uid,
              username: user.displayName.toString(),
              email: user.email.toString(),
              phone: user.phoneNumber.toString(),
              userImg: user.photoURL.toString(),
              userDeviceToken: '',
              country: '',
              userAddress: '',
              street: '',
              isAdmin: false,
              isActive: true,
              createdOn: DateTime.now(),
              city: '');
          await FirebaseFirestore.instance
              .collection('user')
              .doc(user.uid)
              .set(userModel.toMap());
          EasyLoading.dismiss();
          Get.offAll(()=>MainScreen());
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("Error $e");
    }
  }
}
