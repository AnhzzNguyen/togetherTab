import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color _primaryTeal = Color(0xFF0D9488);
  static const Color _darkBg = Color(0xFF121212);
  static const Color _darkSurface = Color(0xFF1E1E1E);
  static const Color _darkSurfaceVariant = Color(0xFF2C2C2C);
  static const Color _textPrimary = Color(0xFFEFEFEF);
  static const Color _textSecondary = Color(0xFFB0B0B0);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: _primaryTeal,
      scaffoldBackgroundColor: _darkBg,
      colorScheme: const ColorScheme.dark(
        primary: _primaryTeal,
        secondary: Color(0xFF06D6A0),
        tertiary: Color(0xFF80DEEA),
        surface: _darkSurface,
        surfaceVariant: _darkSurfaceVariant,
        background: _darkBg,
        error: Color(0xFFCF6679),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: _darkSurface,
        foregroundColor: _textPrimary,
        elevation: 0,
      ),
      cardTheme: CardTheme(
        color: _darkSurface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: _textPrimary,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: _textPrimary,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: _textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: _textPrimary,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: _textSecondary,
          fontSize: 14,
        ),
        labelMedium: TextStyle(
          color: _textPrimary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryTeal,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: _primaryTeal,
        foregroundColor: Colors.white,
      ),
      dividerTheme: const DividerThemeData(
        color: _darkSurfaceVariant,
      ),
    );
  }
}
