import 'package:e_app/firebase_options.dart';
import 'package:e_app/screens/User-App/signIn-screen.dart';
import 'package:e_app/screens/User-App/signUp-Screen.dart';
import 'package:e_app/screens/User-App/splash-screen.dart';
import 'package:e_app/utils/app-colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(color: AppColors.textSecondary, fontSize: 16),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
