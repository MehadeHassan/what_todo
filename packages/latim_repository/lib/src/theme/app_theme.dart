import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Standard Fluter Theme
ThemeData appTheme({
  required final ColorScheme colorScheme,
  final TextTheme? textTheme,
}) {
  final isDark = colorScheme.brightness == Brightness.dark;
  // final typography = Typography.material2018(platform: defaultTargetPlatform);

  final primaryColor = isDark ? colorScheme.surface : colorScheme.primary;
  final onPrimaryColor = isDark ? colorScheme.onSurface : colorScheme.onPrimary;

  // final defaultTextTheme = isDark ? typography.white : typography.black;

  return ThemeData(
    canvasColor: colorScheme.background,
    // scaffoldBackgroundColor: colorScheme.background,
    // backgroundColor: colorScheme.background,
    dialogBackgroundColor: colorScheme.background,

    cardColor: colorScheme.surface,
    bottomAppBarColor: colorScheme.surface,
    dividerColor: colorScheme.onSurface.withOpacity(0.12),

    primaryColor: primaryColor,

    /// The brightness of the [primaryColor]. Used to determine the color of text and
    /// icons placed on top of the primary color (e.g. toolbar text).
    // primaryColorBrightness: ThemeData.estimateBrightnessForColor(primaryColor),
    primaryColorBrightness: colorScheme.brightness,

    errorColor: colorScheme.error,
    indicatorColor: onPrimaryColor,
    // responsible for Overlying surface color on background color
    // if true, it will elevate the surface on background.
    applyElevationOverlayColor: isDark,

    colorScheme: colorScheme,
    brightness: colorScheme.brightness,

    primaryIconTheme: IconThemeData(
      color: onPrimaryColor,
    ),

    // typography: typography,

    // textTheme: defaultTextTheme.merge(textTheme),

    ////////////////////////////////////
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    toggleButtonsTheme: const ToggleButtonsThemeData(),

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
}
