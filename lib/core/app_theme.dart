import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF0B3D91);
  static const Color primaryDark = Color(0xFF1E5DB8);
  static const Color accentColor = Colors.amber;

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      useMaterial3: true,
    );
  }
}
