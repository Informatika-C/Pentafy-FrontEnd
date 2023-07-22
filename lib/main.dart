import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentafy/auth-feature/screens/login_screen.dart';
import 'package:pentafy/auth-feature/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

// Parent Widget Tempat Penyimpanan Global State
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pentafy',
      theme: ThemeData(
        fontFamily: GoogleFonts.hammersmithOne().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1261AA),
          primary: const Color(0xFF1261AA),
          secondary: const Color(0xFF262A32),
          tertiary: const Color(0xFF45F48B),
        ),
        useMaterial3: true,
      ),
      home: isLogin ? LoginScreen() : LoginScreen(),
    );
  }
}
