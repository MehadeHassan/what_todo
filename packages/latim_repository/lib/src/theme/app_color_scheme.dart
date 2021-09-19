import 'package:flutter/material.dart';

/// Standard Material dark Color Palette
ColorScheme get darkColorScheme => const ColorScheme.dark().copyWith(
      // TextFiled labelText,border,
      // TextButton's primary text color
      // OutlinedButton's primary text color
      // ElevatedButton's primary bd color
      primary: Colors.orange.shade200,
      primaryVariant: const Color(0xff3700B3),
      onPrimary: Colors.black,

      // FAB,BottomNavigationBar,
      secondary: Colors.cyan.shade200,
      secondaryVariant: Colors.teal,
      onSecondary: Colors.black,

      // AppBar in DarkTheme
      // SnackBar's backgroundColor
      surface: const Color(0xff121212),
      onSurface: Colors.white,

      background: const Color(0xff121212),
      onBackground: Colors.white,
      // TextField border,errorText,
      // SnackBar
      error: const Color(0xffcf6679),
      onError: Colors.black,
      brightness: Brightness.dark,
    );

/// Standard Material light Color Palette
ColorScheme get lightColorScheme => const ColorScheme.light().copyWith(
      // AppBar in LightTheme
      primary: const Color(0xff6200ee),
      primaryVariant: const Color(0xff3700b3),
      secondary: const Color(0xff03dac6),
      secondaryVariant: const Color(0xff018786),
      surface: Colors.white,
      background: Colors.white,
      error: const Color(0xffb00020),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
    );
