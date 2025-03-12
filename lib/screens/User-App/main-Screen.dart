import 'package:e_app/screens/User-App/welcome-screen.dart';
import 'package:e_app/utils/app-colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PickNBuy"),
        backgroundColor: AppColors.primary,
        actions: [
          GestureDetector(
              onTap: () {
                final FirebaseAuth _auth = FirebaseAuth.instance;
                _auth.signOut();
                GoogleSignIn variable = GoogleSignIn();
                variable.signOut();
                Get.offAll(() => WelcomeScreen());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.logout_rounded,
                  size: 35,
                ),
              ))
        ],
      ),
    );
  }
}
