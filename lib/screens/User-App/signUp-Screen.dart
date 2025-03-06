import 'package:e_app/screens/User-App/signIn-screen.dart';
import 'package:e_app/utils/app-colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/signUp_Controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  SignUpController signUpController = Get.put(SignUpController());
  TextEditingController UserName = TextEditingController();
  TextEditingController UserEmail = TextEditingController();
  TextEditingController UserPhone = TextEditingController();
  TextEditingController UserCity = TextEditingController();
  TextEditingController UserPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Sign Up",
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
                            "Ensure all details are correct before proceeding with sign-up",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            Lottie.asset('assets/signUp.json'),
                          ],
                        ),
                  SizedBox(
                    height: Get.height / 30,
                  ),
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: TextFormField(
                      controller: UserEmail,
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
                  //UserName
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: TextFormField(
                      controller: UserName,
                      cursorColor: AppColors.primary,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: "UserName",
                          prefixIcon: Icon(Icons.person),
                          contentPadding: EdgeInsets.only(top: 5, left: 8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 50,
                  ),
                  //phone
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: TextFormField(
                      controller: UserPhone,
                      cursorColor: AppColors.primary,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: "Phone",
                          prefixIcon: Icon(Icons.phone),
                          contentPadding: EdgeInsets.only(top: 5, left: 8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 50,
                  ),
                  //city
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: TextFormField(
                      controller: UserCity,
                      cursorColor: AppColors.primary,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                          hintText: "City",
                          prefixIcon: Icon(Icons.location_city),
                          contentPadding: EdgeInsets.only(top: 5, left: 8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 50,
                  ),
                  //password
                  Container(
                      width: Get.width,
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Obx(
                        () => TextFormField(
                          controller: UserPassword,
                          obscureText: signUpController.isPasswordVisible.value,
                          cursorColor: AppColors.primary,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    signUpController.isPasswordVisible.toggle();
                                  },
                                  child:
                                      signUpController.isPasswordVisible.value
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

                  SizedBox(
                    height: Get.height / 50,
                  ),
                  Container(
                    width: Get.width / 2,
                    margin: EdgeInsets.only(right: 20, left: 20),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      child: Text(
                        "Sign Up ",
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      onPressed: () async {
                        String name = UserName.text.trim();
                        String email = UserEmail.text.trim();
                        String phone = UserPhone.text.trim();
                        String city = UserCity.text.trim();
                        String password = UserPassword.text.trim();
                        String userDeviceToken = '';
                        if (name.isEmpty ||
                            email.isEmpty ||
                            phone.isEmpty ||
                            password.isEmpty ||
                            name.isEmpty ||
                            city.isEmpty) {
                          Get.snackbar(
                              "Make sure to enter all required information accurately",
                              "",

                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppColors.primary,
                              colorText: Color(0xFFf3f6f8));
                        } else {
                          UserCredential? userCredential =
                              await signUpController.SignUpWithEmailFun(email,
                                  name, phone, city, password, userDeviceToken);
                          if (userCredential != null) {
                            Get.snackbar(
                                "Verification Email Sent.",
                                " Please check your inbox",

                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppColors.primary,
                                colorText: Color(0xFFf3f6f8));
                            Get.offAll(() => SignInScreen());
                          }
                          FirebaseAuth.instance.signOut();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an Account?"),
                      GestureDetector(
                        onTap: () => Get.to(() => SignInScreen()),
                        child: Text(
                          "SignIn",
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
