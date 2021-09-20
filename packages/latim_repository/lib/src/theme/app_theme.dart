import 'package:flutter/material.dart';

ThemeData appThemeData({
  final ColorScheme? colorScheme,
  final Typography? typography,
}) {
  final _colorScheme = colorScheme ?? const ColorScheme.dark();
  final _typography = typography ?? Typography();

  final _isDarkColorScheme = _colorScheme.brightness == Brightness.dark;

  final _primaryColor =
      _isDarkColorScheme ? _colorScheme.surface : _colorScheme.primary;
  final _onPrimaryColor =
      _isDarkColorScheme ? _colorScheme.onSurface : _colorScheme.onPrimary;

  final _textTheme = _isDarkColorScheme ? _typography.white : _typography.black;

  return ThemeData(
    /// [background]
    backgroundColor: _colorScheme.background,
    canvasColor: _colorScheme.background,
    scaffoldBackgroundColor: _colorScheme.background,
    dialogBackgroundColor: _colorScheme.background,

    /// [surface]
    cardColor: _colorScheme.surface,
    dividerColor: _colorScheme.onSurface.withOpacity(.5),
    bottomAppBarColor: _colorScheme.surface,

    /// [primary]
    primaryColor: _primaryColor,
    indicatorColor: _onPrimaryColor,
    primaryColorBrightness: ThemeData.estimateBrightnessForColor(
      _primaryColor,
    ),

    /// [error]
    errorColor: _colorScheme.error,

    /// [overlay in DarkColorScheme]
    applyElevationOverlayColor: _isDarkColorScheme,
    colorScheme: _colorScheme,
    brightness: _colorScheme.brightness,
    textTheme: _textTheme,
    typography: _typography,

    snackBarTheme: SnackBarThemeData(
      backgroundColor: _colorScheme.surface,
      contentTextStyle: TextStyle(
        color: _colorScheme.onSurface,
      ),
    ),
    // primaryIconTheme: _isDarkColorScheme
    //     ? const IconThemeData(color: Colors.red)
    //     : const IconThemeData(color: Colors.green),
    // iconTheme: _isDarkColorScheme
    //     ? const IconThemeData(color: Colors.amber)
    //     : const IconThemeData(color: Colors.blue),
  );
}
