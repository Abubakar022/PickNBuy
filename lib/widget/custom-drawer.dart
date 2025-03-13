import 'package:e_app/utils/app-colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/User-App/welcome-screen.dart';

class DrawerWideget extends StatefulWidget {
  const DrawerWideget({super.key});

  @override
  State<DrawerWideget> createState() => _DrawerWidegetState();
}

class _DrawerWidegetState extends State<DrawerWideget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 25),
      child: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Wrap(
          runSpacing: 10,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Abu Bakar", style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),),
                subtitle: Text("Version 1.0.1", style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),),
                leading: CircleAvatar(
                  radius: 22,
                  backgroundColor: AppColors.primary,
                  child: Text("A"),
                ),
              ),
            ),
            Divider(
              indent: 10,
              endIndent: 10,
              thickness: 1.5,
              color: AppColors.primary,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, ),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Home", style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),),
                
                leading: Icon(Icons.home)
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, ),
              child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text("Product", style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),),

                  leading: Icon(Icons.production_quantity_limits)
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, ),
              child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text("Order", style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),),

                  leading: Icon(Icons.shopping_bag)
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, ),
              child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text("Contact", style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),),

                  leading: Icon(Icons.contact_support)
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, ),
              child: ListTile(
                  onTap: () {
                    final FirebaseAuth _auth = FirebaseAuth.instance;
                    _auth.signOut();
                    GoogleSignIn variable = GoogleSignIn();
                    variable.signOut();
                    Get.offAll(() => WelcomeScreen());
                  },
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text("Logout", style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),),

                  leading: Icon(Icons.logout)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
