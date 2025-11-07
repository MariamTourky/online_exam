import 'package:flutter/material.dart';
import 'package:online_exam/config/theme/app_text_styles.dart';

class AppTheme {
  static const Color primaryBlue = Color(0xff02369C);
  static const Color gray = Color(0xff535353);
  static const Color lightGray = Color(0xff878787);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color error = Colors.red;

  static ThemeData lightTheme() {
    final textTheme = const TextTheme(
      headlineMedium: AppTextStyles.medium20Black,
      bodyLarge: AppTextStyles.baseRegularBlack,
      bodyMedium: AppTextStyles.baseMedium16,
      bodySmall: AppTextStyles.baseRegular14,
    );

    return ThemeData(
      fontFamily: 'Inter',
      useMaterial3: true,
      primaryColor: primaryBlue,
      scaffoldBackgroundColor: white,
      appBarTheme: AppBarTheme(
        backgroundColor: white,
        titleTextStyle: textTheme.headlineMedium,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          disabledBackgroundColor: gray,
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryBlue),
          borderRadius: BorderRadius.circular(8),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyle(color: black),
        hintStyle: textTheme.bodySmall,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: lightGray),
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      textTheme: textTheme,
    );
  }
}
