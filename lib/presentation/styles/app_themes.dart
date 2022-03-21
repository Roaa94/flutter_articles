import 'package:flutter/material.dart';
import 'package:flutter_articles/presentation/styles/app_colors.dart';

class AppThemes {
  static ThemeData mainTheme({bool isDark = false}) {
    return ThemeData(
      fontFamily: 'Roboto',
      brightness: isDark ? Brightness.dark : Brightness.light,
      primaryColor: AppColors.primary,
      primarySwatch: AppColors.getMaterialColorFromColor(AppColors.primary),
      scaffoldBackgroundColor: isDark ? AppColors.secondary : AppColors.white,
      cardColor: isDark ? AppColors.secondaryLight : AppColors.white,
      dividerColor: isDark ? AppColors.white : AppColors.secondary,
      textTheme: const TextTheme(
        headline5: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w700, height: 1.3),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? AppColors.secondary : AppColors.white,
        elevation: 0,
        centerTitle: false,
        toolbarHeight: 70,
        titleTextStyle: TextStyle(
          fontSize: 30,
          color: isDark ? AppColors.white : AppColors.secondary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
