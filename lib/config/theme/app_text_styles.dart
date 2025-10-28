import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();
  static const String _fontFamily = 'Inter';

  static const TextStyle medium20Black = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: AppColors.black,
  );

  static const TextStyle baseRegularBlack = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.black,
  );


  static const TextStyle baseMedium16 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.primaryBlue,
  );

  static const TextStyle baseRegular14 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.gray,
  );
}
