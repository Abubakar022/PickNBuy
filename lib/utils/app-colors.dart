import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors {
  static const Color primary = Color(0xFFF85606); // Deep Blue (Fashionable)
  static const Color secondary =
      Color(0xFFEE6C4D); // Warm Orange (Call to Action)
  static const Color accent = Color(0xFF98C1D9); // Light Blue (Soft Contrast)
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [
      Color(0xFFF85606),
      Color(0xFF2962FF),
      Color(0xFF40C4FF),
      Color(0xFF00C853), // Green
      // Blue
      // Sky Blue
      // Deep Orange
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const Color textPrimary =
      Color(0xFF020202); // Dark Grayish Blue (Readable Text)
  static const Color black =
  Color(0xFF020202); // Dark Grayish Blue (Readable Text)
  static const Color textSecondary = Color(0xFF7B8794); // Light Gray Text

  static const Color background = Color(0xFFFFFFFF); // White
  static const Color white = Color(0xFFFFFFFF); // White
  static const Color statusBar =
      Color(0xFF3D5A80); // Same as Primary for Consistency
}
