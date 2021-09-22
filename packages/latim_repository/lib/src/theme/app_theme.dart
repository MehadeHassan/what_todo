import 'package:flutter/material.dart';

extension on ColorScheme {
  bool get isDark => brightness == Brightness.dark;

  IconThemeData get iconThemeData => isDark
      ? const IconThemeData(color: Colors.white)
      : const IconThemeData(color: Colors.black);
}

ThemeData appThemeData({
  final ColorScheme? colorScheme,
  final Typography? typography,
}) {
  final _colorScheme = colorScheme ?? const ColorScheme.dark();
  final _typography = typography ?? Typography();

  final _textTheme =
      _colorScheme.isDark ? _typography.white : _typography.black;

  return ThemeData(
    
    //! [background]
    backgroundColor: _colorScheme.background,
    canvasColor: _colorScheme.background,
    scaffoldBackgroundColor: _colorScheme.background,
    dialogBackgroundColor: _colorScheme.background,

    //! [surface]
    cardColor: _colorScheme.surface,
    bottomAppBarColor: _colorScheme.surface,

    //! [primary]
    indicatorColor: _colorScheme.primary,

    //! [error]
    errorColor: _colorScheme.error,

    //! [overlay in DarkColorScheme]
    applyElevationOverlayColor: _colorScheme.isDark,

    colorScheme: _colorScheme,
    brightness: _colorScheme.brightness,
    textTheme: _textTheme,
    typography: _typography,

    primaryIconTheme: _colorScheme.iconThemeData,
    iconTheme: _colorScheme.iconThemeData,
  );
}
