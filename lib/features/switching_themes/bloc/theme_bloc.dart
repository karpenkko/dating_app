import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../utils/theme_preference.dart';
import '../utils/themes.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(AppThemes.appThemeData[AppTheme.lightTheme]!) {
    on<InitialThemeSetEvent>((event, emit) async {
      final bool hasDarkTheme = await isDark();
      if (hasDarkTheme) {
        emit(AppThemes.appThemeData[AppTheme.darkTheme]!);
      } else {
        emit(AppThemes.appThemeData[AppTheme.lightTheme]!);
      }
    });

    on<ThemeSwitchEvent>((event, emit) {
      final isDark = state == AppThemes.appThemeData[AppTheme.darkTheme];
      emit(isDark
          ? AppThemes.appThemeData[AppTheme.lightTheme]!
          : AppThemes.appThemeData[AppTheme.darkTheme]!);
      setTheme(isDark);
    });
  }
}
