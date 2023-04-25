import 'package:currency_app/colors/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultTheme {
  final _primarySwatch = MaterialColor(
    0xFFFF5300,
    <int, Color>{
      50: AppColors.o_50,
      100: AppColors.o_100,
      200: AppColors.o_200,
      300: AppColors.o_300,
      400: AppColors.o_400,
      500: AppColors.o_500,
      600: AppColors.o_600,
      700: AppColors.o_700,
      800: AppColors.o_800,
      900: AppColors.o_900,
    },
  );

  ThemeData buildThemeData() {
    return ThemeData(
      primaryColor: AppColors.o_500,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: _primarySwatch,
        backgroundColor: AppColors.b_12,
        cardColor: AppColors.cardColor,
        errorColor: AppColors.redDark,
      ),
      cardColor: AppColors.cardColor,
      scaffoldBackgroundColor: AppColors.b_12,
    );
  }
}
