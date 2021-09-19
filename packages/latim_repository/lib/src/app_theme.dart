// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:latim_repository/latim_repository.dart';
import 'package:latim_repository/src/app_colors.dart';

ThemeData get darkTheme => ThemeData().copyWith(
      colorScheme: const ColorScheme.dark().copyWith(
        background: AppColors.background,
        onBackground: AppColors.onBackground,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryVariant: AppColors.primaryVariant,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        secondaryVariant: AppColors.secondaryVariant,
        error: AppColors.error,
        onError: AppColors.onError,
        brightness: Brightness.dark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
      ),
    );

ThemeData get lightTheme => ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
      ),
    );
