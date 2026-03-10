import 'package:flutter/material.dart';

class AppTheme {
  // Light palette (matches your current design)
  static const Color _lightPrimary = Color(0xFF1976D2); // blue
  static const Color _lightSecondary = Color(0xFFFFA726); // orange
  static const Color _lightBackground = Colors.white;
  static const Color _lightSurface = Colors.white;
  static const Color _lightOnPrimary = Color(0xFF2C1810);
  static const Color _lightOnSurface = Colors.black87;

  // Dark palette
  static const Color _darkPrimary = Color(0xFFFFA726); // warm primary
  static const Color _darkSecondary = Color(0xFF64B5F6); // soft blue
  static const Color _darkBackground = Color(0xFF121212);
  static const Color _darkSurface = Color(0xFF1E1E1E);
  static const Color _darkOnPrimary = Colors.black;
  static const Color _darkOnSurface = Colors.white;

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: _lightPrimary,
        onPrimary: _lightOnPrimary,
        secondary: _lightSecondary,
        onSecondary: _lightOnPrimary,
        error: Color(0xFFD32F2F),
        onError: Colors.white,
        background: _lightBackground,
        onBackground: Colors.black,
        surface: _lightSurface,
        onSurface: _lightOnSurface,
      ),
      scaffoldBackgroundColor: _lightBackground,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: _darkPrimary,
        onPrimary: _darkOnPrimary,
        secondary: _darkSecondary,
        onSecondary: _darkOnPrimary,
        error: Color(0xFFEF5350),
        onError: Colors.black,
        background: _darkBackground,
        onBackground: Colors.white,
        surface: _darkSurface,
        onSurface: _darkOnSurface,
      ),
      scaffoldBackgroundColor: _darkBackground,
    );
  }
}

