import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF1573FE),
    scaffoldBackgroundColor: Colors.white,
    cardColor: const Color(0xFFA1C7FF),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      color: Color(0xFF1573FE),
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF1573FE), //primary
      onPrimary: Color(0xFFE3F4E1), // EX-2
      secondary: Color(0xFFEBF0F0), // EX-3
      onSecondary: Color(0xFF049C6B), // Color-2
      error: Color(0xFFDF1525), // Color-1
      onError: Color(0xFFE8FFEB), //BG-2
      surface: Color(0xFFECE7FE), //EX-1
      onSurface: Color(0xFFDFF1FF), //BG-4
      primaryContainer: Color(0xFFD9D9D9), //Grey-4
      onPrimaryContainer: Colors.white,
      secondaryContainer: Color(0xFF9E9E9E), //Grey-6
      onSecondaryContainer: Colors.black,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFF1573FE),
      unselectedItemColor: Colors.grey,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF89B9FF),
    scaffoldBackgroundColor: const Color(0xFF202020),
    cardColor: const Color(0xFF082E66),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      color: Colors.deepOrange,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF89B9FF), //primary
      onPrimary: Color(0xFF4B514A), // EX-2
      secondary: Color(0xFF4D5151), // EX-3
      onSecondary: Color(0xFF07F8B5), // Color-2
      error: Color(0xFFFF9B9B), // Color-1
      onError: Color(0xFF2A4037), //BG-2
      surface: Color(0xFF413E49), //EX-1
      onSurface: Color(0xFF103E63), //BG-4
      primaryContainer: Color(0xFF767676), //Grey-4
      onPrimaryContainer: Colors.black,
      secondaryContainer: Color(0xFFBDBDBD), //Grey-6
      onSecondaryContainer: Colors.white,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Color(0xFF89B9FF),
      unselectedItemColor: Colors.grey,
    ),
  );
}
