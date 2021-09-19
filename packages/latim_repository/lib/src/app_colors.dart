import 'package:flutter/material.dart';

/// Contrast Checker
/// https://color.adobe.com/create/color-contrast-analyzer
/// https://coolors.co/contrast-checker/ffffff-121212
/// https://colourcontrast.cc/
@immutable
abstract class AppColors {
  /// A color that typically appears behind scrollable content.
  /// Scaffold uses this color.
  static const background = Color(0xff121212);

  /// A color that's clearly legible when drawn on [background].
  /// To ensure that an app is accessible, a contrast ratio of
  /// 4.5:1 for [background] and [onBackground] is recommended.
  static const onBackground = Colors.white;

  /// A dark theme uses dark grey, rather than black, as the primary surface color for components.
  /// Dark grey surfaces can express a wider range of color, elevation, and depth,
  /// because it's easier to see shadows on grey (instead of black).
  /// The background color for widgets like [Card].
  static const surface = Color(0xff121212);

  /// A color that's clearly legible when drawn on [surface].
  /// To ensure that an app is accessible, a contrast ratio of
  /// 4.5:1 for [background] and [onBackground] is recommended.
  static const onSurface = Colors.white;

  /// The color displayed most frequently across your
  /// app’s screens and components.
  static const primary = Color(0xffbb86fc);

  /// A darker version of the primary color.
  static const primaryVariant = Color(0xff3700B3);

  /// A color that's clearly legible when drawn on [primary].
  ///
  /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for [primary]
  /// and [onPrimary] is recommended.
  static const onPrimary = Colors.black;

  /// An accent color that, when used sparingly, calls attention to parts
  /// of your app.
  static const secondary = Color(0xff03dac6);

  /// A darker version of the secondary color.

  static const secondaryVariant = Color(0xff03dac6);

  /// A color that's clearly legible when drawn on [secondary].
  ///
  /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for [secondary]
  /// and [onSecondary] is recommended.
  static const onSecondary = Colors.black;

  /// The color to use for input validation errors, e.g. for
  /// [InputDecoration.errorText].
  static const error = Color(0xffcf6679);

  /// A color that's clearly legible when drawn on [error].
  ///
  /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for [error]
  /// and [onError] is recommended.
  static const onError = Colors.black;
}
