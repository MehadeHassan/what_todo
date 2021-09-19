import 'package:flutter/material.dart';

/// Standard Fluter Theme
ThemeData darkTheme(
  final ColorScheme darkColorScheme,
) =>
    ThemeData(
      colorScheme: darkColorScheme,
      errorColor: darkColorScheme.error,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(),
      ),
      snackBarTheme: const SnackBarThemeData(),
    );

ThemeData lightTheme(
  final ColorScheme lightColorScheme,
) =>
    ThemeData(
      colorScheme: lightColorScheme,
      errorColor: lightColorScheme.error,
    );
