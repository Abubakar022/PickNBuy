import 'package:e_app/utils/app-colors.dart';
import 'package:flutter/material.dart';

class adminScreen extends StatefulWidget {
  const adminScreen({super.key});

  @override
  State<adminScreen> createState() => _adminScreenState();
}

class _adminScreenState extends State<adminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
