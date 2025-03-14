import 'package:e_app/screens/User-App/signUp-Screen.dart';
import 'package:e_app/utils/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/forgetPassword-Controller.dart';

class forgetPasswordScreen extends StatefulWidget {
  const forgetPasswordScreen({super.key});

  @override
  State<forgetPasswordScreen> createState() => _forgetPasswordScreenState();
}

class _forgetPasswordScreenState extends State<forgetPasswordScreen> {
  forgetPasswordController ForgetPasswordController = Get.put
    (forgetPasswordController());
  TextEditingController userEmail = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Forget Password",
            style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
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
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Lottie.asset('assets/forget.json'),
                      ),
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
                      controller: userEmail,
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

                  SizedBox(
                    height: Get.height / 50,
                  ),

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
                        "Forget ",
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      onPressed: () async {
                        String email = userEmail.text.trim();

                        if (email.isEmpty) {
                          Get.snackbar(
                              "Make sure to enter all required information accurately",
                              "",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppColors.primary,
                              colorText: Color(0xFFf3f6f8));
                        }
                        else{
                          String email = userEmail.text.trim();
                          ForgetPasswordController.forgetPasswordControllerFun(email);
                        }
                      },
                    ),
                  ),


                ],
              )),
        ),
      );
    });
  }
}
