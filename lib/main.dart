import 'package:flutter/material.dart';
import 'views/screens/splash_screen.dart';
import 'core/app_theme.dart';

void main() => runApp(const BookNestApp());

class BookNestApp extends StatelessWidget {
  const BookNestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookNest',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
