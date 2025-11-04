import 'package:flutter/material.dart';
import 'package:online_exam/config/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final bool isEnabled;
  final bool isLoading;
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.isEnabled,
    required this.isLoading,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled && !isLoading ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled ? AppColors.primaryBlue : AppColors.gray,
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      child: isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
