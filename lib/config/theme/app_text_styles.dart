import 'package:flutter/material.dart';
import 'package:online_exam/config/theme/app_theme.dart';

class AppTextStyles {
  const AppTextStyles._();
  static const String _fontFamily = 'Inter';

  static const TextStyle medium20Black = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: AppTheme.black,
  );

  static const TextStyle baseRegularBlack = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppTheme.black,
  );

  static const TextStyle baseMedium16 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppTheme.primaryBlue,
  );

  static const TextStyle medium16BlueLined = TextStyle(
    decoration: TextDecoration.underline,
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppTheme.primaryBlue,
  );

  static const TextStyle baseRegular14 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppTheme.gray,
  );
}
