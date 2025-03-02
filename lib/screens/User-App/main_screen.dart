import 'package:e_app/utils/app-colors.dart';
import 'package:flutter/material.dart';

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
        title: Text("StyleBy",style: TextStyle(color: Colors.white),),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
    );
  }
}
