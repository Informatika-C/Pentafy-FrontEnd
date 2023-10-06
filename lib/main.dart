import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentafy/auth-feature/screens/login_screen.dart';

import 'package:pentafy/home-feature/screens/homePage.dart';
import 'package:pentafy/home-feature/services/theme.dart';
import 'package:pentafy/home-feature/services/theme_services.dart';

void main() async {
  await GetStorage.init();
  Get.put(ThemeService());
  WidgetsFlutterBinding.ensureInitialized();
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
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: isLogin ? const HomePage() : const LoginScreen(title: 'Pentafy'),
    );
  }
}
