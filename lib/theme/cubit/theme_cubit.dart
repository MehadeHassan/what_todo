import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> with HydratedMixin<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark);

  @override
  ThemeMode? fromJson(final Map<String, dynamic> json) =>
      ThemeMode.values[json['themeMode'] as int];

  @override
  Map<String, dynamic>? toJson(final ThemeMode state) =>
      <String, dynamic>{'themeMode': state.index};

  void toggleThemeMode() {
    final currentThemeMode = state;
    emit(currentThemeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
  }
}
