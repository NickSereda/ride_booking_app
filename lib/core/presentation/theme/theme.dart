import 'package:flutter/material.dart';

class LightTheme {
  static const Color primaryColor = Color(0xFF5A9BD5);
  static const Color secondaryColor = Color(0xFFF4A261);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color errorColor = Color(0xFFE57373);
  static const Color onPrimaryColor = Colors.white;
  static const Color onSecondaryColor = Colors.black;
  static const Color cardColor = Color(0xFFEAEAEA);
  static const Color onBackgroundColor = Colors.black;
  static const Color onSurfaceColor = Colors.black;
  static const Color onErrorColor = Colors.white;
  static const Color dividerColor = Colors.grey;

  static ThemeData get data => ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surfaceColor,
      error: errorColor,
      onPrimary: onPrimaryColor,
      onSecondary: onSecondaryColor,
      onSurface: onSurfaceColor,
      onError: onErrorColor,
    ),
    dividerColor: dividerColor,
    cardTheme: CardTheme(
      color: cardColor,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: onPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
