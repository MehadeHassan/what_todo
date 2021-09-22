import 'package:flutter/material.dart';
/// Contrast Checker
/// https://color.adobe.com/create/color-contrast-analyzer
/// https://coolors.co/contrast-checker/ffffff-121212
/// https://colourcontrast.cc/

/// Standard Material dark Color Palette
ColorScheme get darkColorScheme => const ColorScheme.dark().copyWith(
      /// ThemeData.canvasColor
      /// ThemeData.scaffoldBackgroundColor [from canvasColor]
      /// ThemeData.backgroundColor
      /// ThemeData.dialogBackgroundColor
      ///
      background: const Color(0xFF121212),
      onBackground: Colors.white,

      ///# ThemData.primaryColor in [Brightness.dark] 
      // ThemeData.cardColor
      // ThemeData.dialogBackgroundColor
      // ThemeData.bottomAppBarColor
      // ThemeData.snackBarTheme.backgroundColor
      ///AppBar.backgroundColor in [Brightness.dark] 
      surface: const Color(0xff121212),
      
      // ThemeData.snackBarTheme.contentTextStyle.color
      onSurface: Colors.white,

      ///# ThemData.primaryColor in [Brightness.light] 
      // TextFiled labelText,border,
      // TextButton's primary
      // OutlinedButton's primary
      // ElevatedButton's primary
      primary: Colors.orange.shade200,
      primaryVariant: const Color(0xff3700B3),
      onPrimary: Colors.black,

      // FAB,BottomNavigationBar,
      secondary: Colors.cyan.shade200,
      secondaryVariant: Colors.teal,
      // FAB's Child
      onSecondary: Colors.black,

      // ThemeData.errorColor
      // TextField border,errorText,
      //
      error: const Color(0xffcf6679),
      onError: Colors.black,

      /// ThemeData.brightness
      brightness: Brightness.dark,
    );

/// Standard Material light Color Palette
ColorScheme get lightColorScheme => const ColorScheme.light().copyWith(
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
