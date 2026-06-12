import 'package:flutter/material.dart';
import 'views/splash_screen.dart';

void main() => runApp(const BookNestApp());

class BookNestApp extends StatelessWidget {
  const BookNestApp({super.key});
  @override
  Widget build(BuildContext context) {
    final darkBlue = const Color(0xFF0B3D91);
    return MaterialApp(
      title: 'BookNest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: darkBlue,
        colorScheme: ColorScheme.fromSeed(seedColor: darkBlue),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: darkBlue, foregroundColor: Colors.white),
      ),
      home: const SplashScreen(),
    );
  }
}
