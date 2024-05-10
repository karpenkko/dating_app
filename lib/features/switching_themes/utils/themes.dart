import 'package:flutter/material.dart';
import 'colors.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      scaffoldBackgroundColor: AppColor.whiteColor,
      primaryColor: AppColor.blackColor,
    ),
    AppTheme.darkTheme: ThemeData(
      scaffoldBackgroundColor: AppColor.blackColor,
      primaryColor: AppColor.whiteColor,
    )
  };
}
enum AppTheme {
  lightTheme,
  darkTheme,
}