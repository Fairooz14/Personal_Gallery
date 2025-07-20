import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF2F7FA),
    primaryColor: const Color(0xFF5A67F2),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Color(0xFF1F2937),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: Color(0xFF111827),
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF1F2937)),
      titleTextStyle: TextStyle(
        color: Color(0xFF1F2937),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
