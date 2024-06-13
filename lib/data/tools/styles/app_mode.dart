import 'package:flutter/material.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';

class MyCustomMode {
  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColorDark,
    textTheme: robotoRegular.apply(
      displayColor: AppColors.white,
      bodyColor: AppColors.white,
    ),
    primaryColor: AppColors.blackForVideoBackground,
    dividerColor: AppColors.white,
    hintColor: AppColors.whiteVeryLight,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: AppColors.backgroundColorDark,
      color: AppColors.backgroundColorDark,
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.white,
      secondary: AppColors.whiteVeryLightV2,
    ),
  );

  ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: robotoRegular.apply(
      displayColor: AppColors.black,
      bodyColor: AppColors.black,
    ),
    dividerColor: AppColors.black,
    hintColor: AppColors.blackLight,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: AppColors.backgroundColor,
      color: AppColors.backgroundColor,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.black,
      secondary: AppColors.blackVeryLightV2
    ),
  );

  ThemeData orangeTheme = ThemeData(
    primaryColor: AppColors.backgroundColorOrange,
    scaffoldBackgroundColor: AppColors.backgroundColorOrange,
    textTheme: robotoRegular.apply(
      displayColor: AppColors.black,
      bodyColor: AppColors.black,
    ),
    dividerColor: AppColors.black,
    hintColor: AppColors.blackVeryLightV2,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: AppColors.backgroundColorOrange,
      color: AppColors.backgroundColorOrange,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.black,
      secondary: AppColors.blackLight
    ),
  );
}