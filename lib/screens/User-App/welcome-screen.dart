import 'package:e_app/screens/User-App/signIn-screen.dart';
import 'package:e_app/utils/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f6f8),
      appBar: AppBar(
        backgroundColor: Color(0xfff3f6f8),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            width: Get.width,
            height: Get.height/10,
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
              borderRadius: BorderRadius.circular(20),
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
              onPressed: () {},
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
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton.icon(
              icon: Image.asset(
              'assets/email.png',
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
                Get.offAll(()=>SignInScreen());
              },
            ),
          )
        ],
      ),
    );
  }
}
