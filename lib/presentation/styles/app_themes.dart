import 'package:flutter/material.dart';
import 'package:flutter_articles/presentation/styles/app_colors.dart';

class AppThemes {
  static ThemeData get mainTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      primarySwatch: AppColors.getMaterialColorFromColor(AppColors.primary),
    );
  }
}
