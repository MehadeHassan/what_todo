import 'package:flutter/material.dart';

/// Contrast Checker
/// https://color.adobe.com/create/color-contrast-analyzer
/// https://coolors.co/contrast-checker/ffffff-121212
/// https://colourcontrast.cc/

ColorScheme get darkColorScheme => const ColorScheme.dark().copyWith(
      //! ThemeData.backgroundColor
      //! ThemeData.canvasColor
      //! ThemeData.scaffoldBackgroundColor
      //! ThemeData.dialogBackgroundColor
      //  showModalBottomSheet.backgroundColor
      background: const Color(0xFF121212),
      onBackground: Colors.white,

      // AppBar.backgroundColor
      //! ThemeData.cardColor
      //! ThemeData.bottomAppBarColor
      surface: const Color(0xFF121212),
      onSurface: Colors.white,

      // TextFiled.focusBorderColor
      // TextFiled.cursorColor
      // TextFiled.cursorColor
      // ElevatedButton.primary
      // OutlinedButton.primary
      // TextButton.primary
      //! ThemeData.indicatorColor

      primary: Colors.orange.shade200,
      primaryVariant: Colors.orange,
      onPrimary: Colors.black,

      // FAB.backgroundColor
      // BottomNavigationBar.selectedItemColor
      secondary: Colors.teal.shade200,
      secondaryVariant: Colors.teal[700],
      onSecondary: Colors.black,

      //! ThemeData.errorColor
      // TextFiled.errorBorder.color
      // TextFiled.errorText.color
      error: const Color(0xffcf6679),
      onError: Colors.black,

      //! ThemeData.brightness
      brightness: Brightness.dark,
    );

ColorScheme get lightColorScheme => const ColorScheme.light().copyWith(
      //! ThemeData.backgroundColor
      //! ThemeData.canvasColor
      //! ThemeData.scaffoldBackgroundColor
      //! ThemeData.dialogBackgroundColor
      //  showModalBottomSheet.backgroundColor
      background: Colors.white,
      onBackground: Colors.black,

      //! ThemeData.cardColor
      //! ThemeData.bottomAppBarColor
      surface: Colors.white,
      // TextFiled.borderColor
      onSurface: Colors.black,

      // AppBar.backgroundColor
      // TextFiled.focusBorderColor
      // TextFiled.cursorColor
      // ElevatedButton.primary
      // OutlinedButton.primary
      // TextButton.primary
      // BottomNavigationBar.selectedItemColor
      //! ThemeData.indicatorColor
      primary: const Color(0xff6200ee),
      primaryVariant: const Color(0xff3700b3),
      onPrimary: Colors.white,

      // FAB.backgroundColor
      secondary: const Color(0xff03dac6),
      secondaryVariant: const Color(0xff018786),
      onSecondary: Colors.black,

      //! ThemeData.errorColor
      // TextFiled.errorBorder.color
      // TextFiled.errorText.color
      error: const Color(0xffb00020),
      onError: Colors.white,

      //! ThemeData.brightness
      brightness: Brightness.light,
    );

ColorScheme get demoColor => ColorScheme.fromSwatch(
      primarySwatch: Colors.red,
      brightness: Brightness.dark,
    );
