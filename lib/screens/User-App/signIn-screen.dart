import 'package:e_app/screens/Admin-App/Admin-Main-Screen.dart';
import 'package:e_app/screens/User-App/forgetPassword-Screen.dart';
import 'package:e_app/screens/User-App/main-Screen.dart';
import 'package:e_app/screens/User-App/signUp-Screen.dart';
import 'package:e_app/screens/User-App/welcome-screen.dart';
import 'package:e_app/utils/app-colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/get-user-Data-controller.dart';
import '../../controllers/signIn-Controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  SignInController signInController = Get.put(SignInController());
  GetUserDataController getUserDataController = Get.put(GetUserDataController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

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
                  Container(
                      width: Get.width,
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Obx(
                        () => TextFormField(
                          cursorColor: AppColors.primary,
                          keyboardType: TextInputType.emailAddress,
                          controller: userPassword,
                          obscureText: signInController.isPasswordVisible.value,
                          decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    signInController.isPasswordVisible.toggle();
                                  },
                                  child:
                                      signInController.isPasswordVisible.value
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility)),
                              contentPadding: EdgeInsets.only(top: 5, left: 8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      )),
                  SizedBox(
                    height: Get.height / 50,
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 15),
                      alignment: Alignment.centerRight,
                      child: GestureDetector(onTap: (){
                          Get.to(()=>forgetPasswordScreen());
                      },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(color: AppColors.primary),
                        ),
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
                        "Sign In ",
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      onPressed: () async {
                        String email = userEmail.text.trim();
                        String password = userPassword.text.trim();
                        if (email.isEmpty || password.isEmpty) {
                          Get.snackbar(
                              "Make sure to enter all required information accurately",
                              "",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppColors.primary,
                              colorText: Color(0xFFf3f6f8));
                        } else {
                          UserCredential userCredential =
                              await signInController.SignInWithEmailFun(
                                  email, password) as UserCredential;
                          var userData = await getUserDataController.getUserData
                            (userCredential.user!.uid);
                          if (userCredential.user!.emailVerified) {
                            if(userData[0]['isAdmin']==true){

                                Get.snackbar("Login Successfully As a Admin ",
                                    "",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: AppColors.primary,
                                    colorText: Color(0xFFf3f6f8));
                                Get.off(()=>adminScreen());
                            }else{
                              Get.snackbar("Login Successfully", "",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppColors.primary,
                                  colorText: Color(0xFFf3f6f8));
                              Get.offAll(() => MainScreen());
                            }

                          } else {
                            Get.snackbar(
                                "Email verification required. Please check your inbox and verify your email to proceed",
                                "",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppColors.primary,
                                colorText: Color(0xFFf3f6f8));
                          }
                        }
                      },
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
                        onTap: () => Get.off(() => SignUpScreen()),
                        child: Text(
                          "SignUP",
                          style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              )),
        ),
      );
    });
  }
}
