import 'package:e_app/screens/User-App/signUp-Screen.dart';
import 'package:e_app/utils/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Sign In",
            style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                isKeyboardVisible
                    ? Container(
                        margin: EdgeInsets.only(left: 15),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Please Enter Your Email and Password",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          Lottie.asset('assets/signIn.json'),
                        ],
                      ),
                SizedBox(
                  height: Get.height / 30,
                ),
                Container(
                  width: Get.width,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    cursorColor: AppColors.primary,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email),
                        contentPadding: EdgeInsets.only(top: 5, left: 8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                SizedBox(
                  height: Get.height / 50,
                ),
                Container(
                  width: Get.width,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    cursorColor: AppColors.primary,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: Icon(Icons.visibility_off),
                        contentPadding: EdgeInsets.only(top: 5, left: 8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                SizedBox(
                  height: Get.height / 50,
                ),
                Container(
                    margin: EdgeInsets.only(right: 15),
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(color: AppColors.primary),
                    )),
                SizedBox(
                  height: Get.height / 50,
                ),
                //Button Sign In
                Container(
                  width: Get.width / 2,
                  margin: EdgeInsets.only(right: 20, left: 20),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    child: Text(
                      "Sign in ",
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: Get.height / 50,
                ),
                // Sign Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account? "),
                    GestureDetector(
                      onTap: ()=>Get.offAll(()=>SignUpScreen()),
                      child: Text("SignUP",style: TextStyle(color:AppColors.primary,
                          fontWeight:
                          FontWeight
                          .bold),),
                    )
                  ],
                )
              ],
            )),
      );
    });
  }
}
