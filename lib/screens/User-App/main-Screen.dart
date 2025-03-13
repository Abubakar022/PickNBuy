import 'package:e_app/screens/User-App/welcome-screen.dart';
import 'package:e_app/utils/app-colors.dart';
import 'package:e_app/widget/banner-widget.dart';
import 'package:e_app/widget/custom-drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
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
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("PickNBuy", style: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
        backgroundColor: AppColors.primary,
      ),
      drawer: DrawerWideget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height/90,
              ),
//banner

            BannerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
