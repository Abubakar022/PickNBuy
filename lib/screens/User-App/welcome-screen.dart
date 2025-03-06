import 'package:e_app/screens/User-App/signIn-screen.dart';
import 'package:e_app/utils/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/google.dart';

class WelcomeScreen extends StatefulWidget {

   WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GoogleSignInController _googleSignInController = Get.put
    (GoogleSignInController());

  var Height = Get.height/3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f6f8),
      appBar: AppBar(
        backgroundColor: Color(0xfff3f6f8),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 50,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: Get.width,
              height: Height,
              child: Lottie.asset('assets/welcome.json'),
            ),
            SizedBox(
              height: Get.height / 30,
            ),
            Text(
              "Trendy, Seamless, Exciting",
              style: GoogleFonts.merriweather(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: Get.height / 5,
            ),
            Container(
              width: Get.width,
              margin: EdgeInsets.only(right: 20, left: 20),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton.icon(
                icon: Image.asset(
                  'assets/google.png',
                  width: 25,
                  height: 25,
                ),
                label: Text(
                  "Sign in with Google",
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                onPressed: () {
                  _googleSignInController.GoogleSignInFun();
                },
              ),
            ),
            SizedBox(
              height: Get.height / 40,
            ),
            Container(
              width: Get.width,
              margin: EdgeInsets.only(right: 20, left: 20),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton.icon(
                icon: Image.asset(
                'assets/email.png',
                  color: Colors.white,
                  width: 30,
                  height: 30,
                ),
                label: Text(

                  "Sign in with Email",
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                onPressed: () {
                  Get.to(()=>SignInScreen());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
