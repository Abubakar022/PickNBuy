import 'dart:async';

import 'package:e_app/screens/Admin-App/Admin-Main-Screen.dart';
import 'package:e_app/screens/User-App/main-Screen.dart';
import 'package:e_app/screens/User-App/welcome-screen.dart';
import 'package:e_app/utils/app-colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/get-user-Data-controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 1), () {
      IsUserLogIn(context);
    });

  }
  Future<void> IsUserLogIn( BuildContext context)async{
    if(user != null){
      GetUserDataController getUserDataController = Get.put
      (GetUserDataController());
      var userData = await getUserDataController.getUserData(user!.uid);
      if(userData[0]['isAdmin']==true){
          Get.off(()=>adminScreen());
      }
      else{
          Get.off(()=>MainScreen());
      }
    }else{
        Get.off(()=>WelcomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(

                  width: Get.width,

                  // alignment: Alignment.center,
                  child: Lottie.asset('assets/splash.json'),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " Pick",
                      style: GoogleFonts.dancingScript(
                          fontSize: 50, fontWeight: FontWeight.bold, color:
                      Colors.white),
                    ),
                    Text(
                      " N ",
                      style: GoogleFonts.dancingScript(
                          fontSize: 50, fontWeight: FontWeight.bold, color:
                      Colors.black),
                    ),
                    Text(
                      "Buy",
                      style: GoogleFonts.dancingScript(
                          fontSize: 50, fontWeight: FontWeight.bold, color:
                      Colors.white),
                    ),
                  ],
                ),

                Text(
                  "Trendy, Seamless, Exciting",
                  style: GoogleFonts.merriweather(
                      fontSize: 20, fontWeight: FontWeight.bold, color:
                  Colors.white),
                ),
              ],
            ),

          ),

          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              "Design by Tiraz",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
