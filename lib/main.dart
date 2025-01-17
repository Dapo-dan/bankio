import 'package:bankio/presentation/screens/splash_screen.dart';
import 'package:bankio/utils/app_themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bankio',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme, // Light theme
      darkTheme: AppThemes.darkTheme, // Dark theme
      themeMode: ThemeMode.system, // Use system theme by default
      home: const SplashScreen(),
    );
  }
}
