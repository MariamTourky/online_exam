import 'package:flutter/material.dart';
import 'package:online_exam/config/theme/app_text_styles.dart';
import '../../config/theme/app_theme.dart';
void showAppSnackbar(
    BuildContext context,
    String message, {
      bool isError = false,
    }) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.baseMedium16.copyWith(color: AppTheme.white),
        ),
        backgroundColor: isError ? AppTheme.error : AppTheme.primaryBlue,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
}

